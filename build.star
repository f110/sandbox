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
    event = ["push"],
)

job(
    name = "release",
    command = "run",
    targets = ["//:release"],
    platforms = [
        "@io_bazel_rules_go//go/toolchain:linux_amd64",
    ],
    event = ["manual"],
    secrets = [
        secret(mount_path = "/var/github", vault_path = "/globemaster/github-app/heimdallr-release", vault_key = "privatekey"),
        secret(env_name = "GITHUB_APP_ID", vault_path = "/globemaster/github-app/heimdallr-release", vault_key = "appid"),
        secret(env_name = "GITHUB_INSTALLATION_ID", vault_path = "/globemaster/github-app/heimdallr-release", vault_key = "installationid"),
    ],
)
