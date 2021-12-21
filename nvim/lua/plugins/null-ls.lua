local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		diagnostics.cppcheck,
		diagnostics.eslint,
		diagnostics.flake8.with({ extra_args = { "--append-config", vim.fn.expand("~/.config/flake8") } }),
		diagnostics.golangci_lint,
		diagnostics.luacheck,
		diagnostics.markdownlint,
		diagnostics.mypy.with({ extra_args = { "--ignore-missing-imports" } }),
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
