from beet.library.data_pack import Function, FunctionTag
from beet.toolchain.context import Context

import rich

call = (
    'execute '
    'if score #smithed.core.major load.status matches {major} '
    'if score #smithed.core.minor load.status matches {minor} '
    'if score #smithed.core.patch load.status matches {patch} '
    'run function {path}'
)


def beet_default(ctx: Context):
    ctx.template.globals['version'] = f'v{ctx.project_version}'

    yield

    for container in ctx.data["smithed"].values():
        for path in list(container):
            container[path.replace("__version__", ctx.template.globals['version'])] = container.pop(path)

    for path in ctx.data.functions.match('impl'):
        first_line = ctx.data.functions[path].text.split('\n')[0]
        if first_line.startswith('#') and '@public' in first_line:
            generate_call(ctx, path, ctx.template.globals['version'])


def generate_call(ctx, path: str, version: str):
    print('  api:', '#smithed:core/pub/' + path.split(version)[1][1:])
    major, minor, patch = version.replace('v', '').split('.')

    tag = {
        "values": []
    }

    tag['values'].append(path.replace('impl', 'calls'))

    ctx.data['smithed:core/pub/' + path.split(version)[1][1:]] = FunctionTag(tag)
    ctx.data[path.replace('impl', 'calls')] = Function(call.format(major=major, minor=minor, patch=patch, path=path))
