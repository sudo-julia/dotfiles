local null_ls = require("null-ls")
local on_attach = require("plugins.on_attach").on_attach
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.config({
	sources = {
		diagnostics.cppcheck,
		diagnostics.eslint,
		diagnostics.flake8.with({ extra_args = { "--append-config", vim.fn.expand("~/.config/flake8") } }),
		diagnostics.golangci_lint,
		diagnostics.luacheck,
		diagnostics.markdownlint,
		diagnostics.pylint,
		diagnostics.shellcheck.with({ filetypes = { "bash", "sh" } }),
		diagnostics.stylelint,
		formatting.black,
		formatting.clang_format.with({
			extra_args = { "-style", '"{BasedOnStyle: Mozilla, IndentWidth: 8}"' },
		}),
		formatting.gofmt,
		formatting.prettier.with({
			filetypes = { "css", "html", "json", "javascript", "markdown", "yaml" },
		}),
		formatting.shfmt.with({ extra_args = { "-i", "2", "-ci", "-p" }, filetypes = { "bash", "sh" } }),
		formatting.stylua,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = on_attach,
})
