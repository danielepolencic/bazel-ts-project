load("@npm//@bazel/typescript:index.bzl", "ts_config", "ts_project")

package(default_visibility = ["//visibility:public"])

ts_config(
    name = "tsconfig",
    src = "tsconfig.json",
    deps = [
        "//:tsconfig",
    ],
)

ts_project(
    name = "blog",
    srcs = [
        "index.ts",
    ],
    composite = True,
    declaration = True,
    tsconfig = "tsconfig",
    deps = [
        "//app/blog/report-2021q1:article",
    ]
)
