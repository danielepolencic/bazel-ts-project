"""blog_post
"""

load("@npm//@bazel/typescript:index.bzl", "ts_config", "ts_project")
load("@build_bazel_rules_nodejs//:index.bzl", "js_library")

ALL_IMAGES = [
    "*.svg",
    "*.png",
    "*.gif",
    "*.jpg",
    "**/assets/*.svg",
    "**/assets/*.png",
    "**/assets/*.gif",
    "**/assets/*.jpg",
]

ALL_MARKDOWN = ["*.md", "**/*.md"]

ALL_OTHER_ASSETS = [
    "*.js",
    "*.pdf",
    "assets/*.pdf",
]

def blog_post(exclude_svgs = []):
    native.filegroup(
        name = "assets",
        srcs = native.glob(ALL_IMAGES + ALL_OTHER_ASSETS + ALL_MARKDOWN, exclude = ["README.md", "splinters/*"])
    )

    ts_config(
        name = "tsconfig",
        src = "tsconfig.json",
        deps = [
            "//:tsconfig",
        ],
    )

    ts_project(
        name = "article_ts",
        srcs = native.glob(
            [
                "*.ts",
                "*.tsx",
            ],
        ),
        composite = True,
        declaration = True,
        tsconfig = "tsconfig",
        deps = [
            "@npm//@types/node",
        ]
    )

    js_library(
        name = "article",
        deps = [
            "article_ts",
        ],
    )

