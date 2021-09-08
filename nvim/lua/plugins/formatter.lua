require("formatter").setup({
	logging = false,
	filetype = {
		bash = {
			function()
				return { exe = "shfmt", stdin = true }
			end,
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						"--assume-filename",
						vim.api.nvim_buf_get_name(0),
						"--style",
						"LLVM",
					},
					stdin = true,
					cwd = vim.fn.expand("%:p:h"),
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						"--assume-filename",
						vim.api.nvim_buf_get_name(0),
						"--style",
						"LLVM",
					},
					stdin = true,
					cwd = vim.fn.expand("%:p:h"),
				}
			end,
		},
		css = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--parser",
						"css",
					},
					stdin = true,
				}
			end,
		},
		html = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--tab-width",
						4,
					},
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return { exe = "stylua", args = { "-s", "-" }, stdin = true }
			end,
		},
		python = {
			function()
				return { exe = "black", args = { "-" }, stdin = true }
			end,
		},
		rust = {
			function()
				return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
			end,
		},
		sh = {
			function()
				return { exe = "shfmt", args = { "-sp" }, stdin = true }
			end,
		},
	},
})
