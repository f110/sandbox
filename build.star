job(
    name = "test_all",
    all_revision = True,
    command = "test",
    github_status = True,
    targets = ["//..."],
    cpu_limit = "300m",
    exclusive = True,
)
