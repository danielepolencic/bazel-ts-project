load("@build_bazel_rules_nodejs//:index.bzl", "js_library")

package(default_visibility = ["//visibility:public"])

js_library(
    name = "hast",
    # Code that depends on this target can import from "@myco/mypkg"
    package_name = "@types/hast",
    # Consumers might need fields like "main" or "typings"
    srcs = [
        "hast.d.ts",
        "package.json",
    ],
    # The .js and .d.ts outputs from above will be part of the package
    # deps = glob(["*.d.ts"]),
)