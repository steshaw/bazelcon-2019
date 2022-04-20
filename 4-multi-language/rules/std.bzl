load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_java//java:defs.bzl", "java_proto_library")
load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")

def std_grpc(
  name, srcs, go_importpath,
  visibility = ["//visibility:public"],
):
    java = "%s-java" % name

    proto_library(
        name = name,
        srcs = srcs,
        visibility = visibility,
    )

    go_proto_library(
        name = "%s-go" % name,
        compilers = ["@io_bazel_rules_go//proto:go_grpc"],
        importpath = go_importpath,
        proto = ":api-proto",
        visibility = visibility,
    )

    java_proto_library(
        name = java,
        deps = [name],
        visibility = visibility,
    )

    java_grpc_library(
        name = "%s-lib" % java,
        srcs = [name],
        deps = [java],
        visibility = visibility,
    )
