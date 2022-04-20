load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_java//java:defs.bzl", "java_proto_library")
load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")

def std_grpc():
    proto_library(
        name = "api-proto",
        srcs = ["api.proto"],
    )

    go_proto_library(
        name = "api_proto_go",
        compilers = ["@io_bazel_rules_go//proto:go_grpc"],
        importpath = "proto/grocery/api",
        proto = ":api-proto",
    )

    java_proto_library(
        name = "api-proto-java",
        deps = [":api-proto"],
    )

    java_grpc_library(
        name = "api_proto_java_lib",
        srcs = [":api-proto"],
        deps = [":api-proto-java"],
    )
