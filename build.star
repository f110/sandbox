job(
    name = "test_all",
    all_revision = True,
    command = "test",
    github_status = True,
    targets = [
        "//...",
    ],
    platforms = [
        "@io_bazel_rules_go//go/toolchain:linux_amd64",
    ],
    cpu_limit = "300m",
    exclusive = True,
)

job(
    name = "release",
    command = "run",
    targets = ["//:release"],
    platforms = [
        "@io_bazel_rules_go//go/toolchain:linux_amd64",
    ],
    event = ["manual"],
)
