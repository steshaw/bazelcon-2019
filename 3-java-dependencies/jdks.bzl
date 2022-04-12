load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def jdks():
    http_archive(
        name = "jdk8_linux",
        build_file = "@local_jdk//:BUILD.bazel",
        sha256 = "568e7578f1b20b1e62a8ed2c374bad4eb0e75d221323ccfa6ba8d7bc56cf33cf",
        strip_prefix = "zulu8.38.0.13-ca-jdk8.0.212-linux_x64",
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-linux_x64.tar.gz",
        ],
    )

    http_archive(
        name = "jdk8_macos",
        build_file = "@local_jdk//:BUILD.bazel",
        sha256 = "64538f3eed34a298cc48168e89326fd323a55d801a3e6b2c3cc948effe124250",
        strip_prefix = "zulu8.38.0.13-ca-jdk8.0.212-macosx_x64",
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-macosx_x64.tar.gz",
        ],
    )

    http_archive(
        name = "jdk8_windows",
        build_file = "@local_jdk//:BUILD.bazel",
        sha256 = "f5367fc29485252e91d3d1d28b069277b7133dfa2e104fc181af4373267d3a82",
        strip_prefix = "zulu8.38.0.13-ca-jdk8.0.212-win_x64",
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-win_x64.zip",
        ],
    )
