load("@build_bazel_rules_nodejs//:index.bzl", "js_library")

def types(type_name):
    js_library(
        name = type_name,
        package_name = "@types/" + type_name,
        srcs = [
            type_name + ".d.ts",
            ":package_json"
        ],
    
    )

    create_package_json(
        name = "package_json",
        srcs = native.glob(
            [
                "**/*.d.ts",
            ]
        ),
        template = "//types:template.package.json"
    )

def _create_package_json(ctx):
    outs = []
    for src_file in ctx.files.srcs:
        subDir = src_file.dirname.split("types/").pop()
        out = ctx.actions.declare_file("package.json")
        outs.append(out)
        ctx.actions.expand_template(
            output = out,
            template = ctx.file.template,
            substitutions = {"{NAME}": subDir},
        )
    return DefaultInfo(
        files = depset(outs),
    )

create_package_json = rule(
    _create_package_json,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            allow_empty = False,
            mandatory = True,
        ),
        "template": attr.label(
            allow_single_file = [".json"],
            mandatory = True,
        ),
    },
)
