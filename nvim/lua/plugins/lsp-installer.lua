local lsp_installer = require("nvim-lsp-installer")
local on_attach = require("plugins.lspconfig").on_attach

lsp_installer.on_server_ready(function(server)
	local opts = { on_attach = on_attach }

	server:setup(opts)
	vim.cmd([[do User LspAttatchBuffers]])
end)
