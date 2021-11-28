local lspconfig = require("lspconfig")
local coq = require("coq")
local on_attach = require("plugins.on_attach").on_attach
local on_attach_no_format = require("plugins.on_attach").on_attach_no_format

-- server confs
lspconfig.clangd.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach_no_format,
}))

lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach_no_format,
}))

do
	local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/lua"
	local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = { path = runtime_path },
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = { library = vim.api.nvim_get_runtime_file("", true) },
				},
				telemetry = { enable = false },
			},
		},
		on_attach = on_attach,
	}))
end

lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
	settings = {
		python = {
			pythonPath = "/usr/bin/python3",
			venvPath = "/home/jam/lib/cache/pypoetry/virtualenvs",
			analysis = { useLibraryCodeForTypes = true },
		},
	},
	on_attach = on_attach,
}))

lspconfig.rls.setup(coq.lsp_ensure_capabilities({
	cmd = { "rustup", "run", "stable", "rls" },
	filetypes = { "rust" },
	settings = { rust = { all_features = true, clippy_preference = "on" } },
	on_attach = on_attach,
}))

-- set up all servers that require no extra configuration
local servers = { "bashls", "jsonls", "tsserver", "vimls", "yamlls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
end
