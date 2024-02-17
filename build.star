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
    cpu_limit = "2000m",
    exclusive = True,
    event = ["push", "pull_request"],
)

job(
    name = "publish",
    command = "run",
    targets = ["//container/tree:push"],
    platforms = [
        "@io_bazel_rules_go//go/toolchain:linux_amd64",
    ],
    secrets = [
        registry_secret(host = "registry.f110.dev", vault_mount = "secrets", vault_path = "globemaster/registry.f110.dev/sandbox", vault_key = "sandbox"),
    ],
    cpu_limit = "2000m",
    event = ["manual"],
)

#job(
#    name = "release",
#    command = "run",
#    targets = ["//cmd/tree:tree"],
#    platforms = [
#        "@io_bazel_rules_go//go/toolchain:linux_amd64",
#    ],
#    event = ["manual"],
#    secrets = [
#        secret(mount_path = "/var/github", vault_mount = "globemaster", vault_path = "github-app/heimdallr-release", vault_key = "privatekey"),
#        secret(mount_path = "/var/github", vault_mount = "globemaster", vault_path = "github-app/heimdallr-release", vault_key = "appid"),
#        secret(mount_path = "/var/github", vault_mount = "globemaster", vault_path = "github-app/heimdallr-release", vault_key = "installationid"),
#    ],
#    env = {
#        "DIR_PATH": "/var/github"
#    },
#)
#
