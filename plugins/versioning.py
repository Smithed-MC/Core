from typing import Optional

from beet.library.data_pack import Function, FunctionTag
from beet.toolchain.context import Context

version_part_names = ["major", "minor", "patch"]
next_step_names = [*version_part_names[1:], None]
step_pairs = zip(version_part_names, next_step_names)


def combine_part_names(format: str):
    return "".join(format.format(name=name) for name in version_part_names)


def combine_parts(format: str, version_parts):
    return "".join(
        format.format(name=name, part=part)
        for name, part in zip(version_part_names, version_parts)
    )


def call_if_version_match(key, version_parts, path):
    return (
        "execute "
        + combine_parts(
            f"if score {key}.{{name}} load.status matches {{part}} ", version_parts
        )
        + f"run function {path}"
    )


def resolve(ctx: Context, root, version, key, version_parts):
    name = f"{root}/calls/{version}/technical/resolve"

    ctx.data[name] = Function(
        f"schedule clear {root}/impl/{version}/technical/tick\n"
        + call_if_version_match(
            key, version_parts, f"{root}/impl/{version}/technical/load"
        )
    )

    ctx.data[f"{root}/load/resolve"] = FunctionTag({"values": [name]})


def enumerate_step_name(root, version, step):
    return f"{root}/calls/{version}/technical/enumerate/{step}"


def enumerate(ctx: Context, key, root, version):
    name = f"{root}/calls/{version}/technical/enumerate"

    ctx.data[name] = Function(
        f"scoreboard players reset {key}.set load.status\n"
        + combine_part_names(f"scoreboard players add {key}.{{name}} load.status 0\n")
        + f"function {enumerate_step_name(root, version_part_names[0], version)}"
    )

    ctx.data[f"{root}/load/enumerate"] = FunctionTag({"values": [name]})


def enumerate_step(
    ctx: Context,
    key,
    root,
    version,
    step,
    next_step: Optional[str],
    value,
    set_version_func,
):
    step_body = (
        "execute"
        f"if score {key}.{step} load.status matches ..{value} "
        f"unless score {key}.{step} load.status matches {value} "
        f"run function {set_version_func}"
    )

    if next_step is not None:
        step_body += (
            "\n"
            "execute"
            f"unless score {key}.set load.status matches 1 "
            f"if score {key}.{step} load.status matches ..{value} "
            f"if score {key}.{step} load.status matches {value} "
            f"run function {enumerate_step_name(root, version, next_step)}"
        )

    ctx.data[enumerate_step_name(root, version, step)] = Function(step_body)


def set_version(ctx: Context, root, key, version, version_parts):
    name = f"{root}/calls/{version}/technical/enumerate/set_version"

    ctx.data[name] = Function(
        combine_parts(
            f"scoreboard players set {key}.{{name}} load.status {{part}}", version_parts
        )
        + f"scoreboard players set {key}.set load.status 1"
    )

    return name


def replace_version(ctx: Context, version):
    # TODO: Support multiple, configurable namespaces
    for container in ctx.data["smithed"].values():
        for path in list(container):
            container[path.replace("__version__", version)] = container.pop(path)


def generate_call(ctx, path: str, version: str, version_parts, root: str, key: str):
    api_path = f"#{root}/pub/{path.split(version)[1][1:]}"
    call_path = path.replace("impl", "calls")

    print("  api:", api_path)

    ctx.data[api_path] = FunctionTag({"values": [call_path]})
    ctx.data[call_path] = Function(call_if_version_match(key, version_parts, path))


def generate_api_calls(ctx: Context, version, version_parts, root, key):
    for path in ctx.data.functions.match("impl"):
        # TODO: Support @public on any line of the function doc comment: https://github.com/SpyglassMC/Spyglass/wiki/IMP-Doc
        first_line = ctx.data.functions[path].text.split("\n")[0]
        if first_line.startswith("#") and "@public" in first_line:
            generate_call(ctx, path, version, version_parts, root, key)


def beet_default(ctx: Context):
    version = ctx.template.globals["version"] = f"v{ctx.project_version}"
    key = ctx.meta["versioning"]["key"]
    root = ctx.meta["versioning"]["root"]
    version_parts = ctx.project_version.split(".")

    yield

    replace_version(ctx, version)
    generate_api_calls(ctx, version, version_parts, root, key)

    resolve(ctx, root, version, key, version_parts)
    enumerate(ctx, key, root, version)

    set_version_func = set_version(ctx, root, key, version, version_parts)

    for (step, next_step), part in zip(step_pairs, version_parts):
        enumerate_step(ctx, key, root, version, step, next_step, part, set_version_func)
