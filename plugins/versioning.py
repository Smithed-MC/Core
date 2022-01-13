from beet.library.data_pack import Function, FunctionTag
from beet.toolchain.context import Context

call = (
    'execute '
        'if score {key}.major load.status matches {major} '
        'if score {key}.minor load.status matches {minor} '
        'if score {key}.patch load.status matches {patch} '
        'run function {path}'
)

resolve_text = (
    'schedule clear {root}/impl/{version}/technical/tick\n'
    'execute '
        'if score {key}.major load.status matches {major} '
        'if score {key}.minor load.status matches {minor} '
        'if score {key}.patch load.status matches {patch} '
        'run function {root}/impl/{version}/technical/load'
)

enumerate_text = (
    'scoreboard players add {key}.major load.status 0\n'
    'scoreboard players add {key}.minor load.status 0\n'
    'scoreboard players add {key}.patch load.status 0\n'
    'function {root}/calls/{version}/technical/enumerate/major\n'
    'scoreboard players reset {key}.set load.status\n'
)

major_text = (
    'execute '
        'if score {key}.major load.status matches ..{major} '
        'unless score {key}.major load.status matches {major} '
        'run function {root}/calls/{version}/technical/enumerate/set_version\n'
    'execute '
        'if score {key}.major load.status matches ..{major} '
        'if score {key}.major load.status matches {major} '
        'unless score {key}.set load.status matches 1 '
        'run function {root}/calls/{version}/technical/enumerate/minor'
)

minor_text = (
    'execute '
        'if score {key}.minor load.status matches ..{minor} '
        'unless score {key}.minor load.status matches {minor} '
        'run function {root}/calls/{version}/technical/enumerate/set_version\n'
    'execute '
        'if score {key}.minor load.status matches ..{minor} '
        'if score {key}.minor load.status matches {minor} '
        'unless score {key}.set load.status matches 1 '
        'run function {root}/calls/{version}/technical/enumerate/patch'
)

patch_text = (
    'execute '
        'if score {key}.patch load.status matches ..{patch} '
        'unless score {key}.patch load.status matches {patch} '
        'run function {root}/calls/{version}/technical/enumerate/set_version'
)

set_version = (
    'scoreboard players set {key}.major load.status {major}\n'
    'scoreboard players set {key}.minor load.status {minor}\n'
    'scoreboard players set {key}.patch load.status {patch}\n'
    'scoreboard players set {key}.set load.status 1'
)

def beet_default(ctx: Context):
    version = ctx.template.globals['version'] = f'v{ctx.project_version}'
    key = ctx.meta['versioning']['key']
    root = ctx.meta['versioning']['root']
    major, minor, patch = version.replace('v', '').split('.')

    yield

    for container in ctx.data["smithed"].values():
        for path in list(container):
            container[path.replace("__version__", version)] = container.pop(path)

    for path in ctx.data.functions.match('impl'):
        first_line = ctx.data.functions[path].text.split('\n')[0]
        if first_line.startswith('#') and '@public' in first_line:
            generate_call(ctx, path, version, root, key)

    ctx.data[f'{root}/calls/{version}/technical/resolve'] = Function(
        resolve_text.format(root=root, key=key, version=version, major=major, minor=minor, patch=patch)
    )

    ctx.data[f'{root}/calls/{version}/technical/enumerate'] = Function(
        enumerate_text.format(root=root, key=key, version=version)
    )

    ctx.data[f'{root}/calls/{version}/technical/enumerate/major'] = Function(
        major_text.format(root=root, key=key, version=version, major=major)
    )

    ctx.data[f'{root}/calls/{version}/technical/enumerate/minor'] = Function(
        minor_text.format(root=root, key=key, version=version, minor=minor)
    )

    ctx.data[f'{root}/calls/{version}/technical/enumerate/patch'] = Function(
        patch_text.format(root=root, key=key, version=version, patch=patch)
    )

    ctx.data[f'{root}/calls/{version}/technical/enumerate/set_version'] = Function(
        set_version.format(root=root, key=key, version=version, major=major, minor=minor, patch=patch)
    )
    
    ctx.data[f'{root}/load/enumerate'] = FunctionTag(
        {"values":["{root}/calls/{version}/technical/{tag}".format(root=root, version=version, tag='enumerate')]}
    )
    ctx.data[f'{root}/load/resolve'] = FunctionTag(
        {"values":["{root}/calls/{version}/technical/{tag}".format(root=root, version=version, tag='resolve')]}
    )


def generate_call(ctx, path: str, version: str, root: str, key: str):
    print('  api:', f'#{root}/pub/' + path.split(version)[1][1:])
    major, minor, patch = version.replace('v', '').split('.')

    tag = {
        "values": []
    }

    tag['values'].append(path.replace('impl', 'calls'))

    ctx.data[f'{root}/pub/' + path.split(version)[1][1:]] = FunctionTag(tag)
    ctx.data[path.replace('impl', 'calls')] = Function(call.format(major=major, minor=minor, patch=patch, path=path, key=key))
