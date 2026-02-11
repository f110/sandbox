jobs: {
	publish: {
		command: "run"
		targets: ["//container/tree:push"]
		platforms: ["@io_bazel_rules_go//go/toolchain:linux_amd64"]
		secrets: [
			{
				host: "regiostry.f110.dev"
				vault_mount: "globemaster"
				vault_path: "regiostry.f110.dev/sandbox"
				vault_key: "robot$sandbox"
		  }
		]
		cpu_limit: "2000m"
		event: ["manual"]
	}
}
