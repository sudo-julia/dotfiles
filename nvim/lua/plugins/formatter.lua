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
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"-style",
						'"{BasedOnStyle: Mozilla, IndentWidth: 8}"',
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
					},
					stdin = true,
				}
			end,
		},
		json = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--parser",
						"json",
					},
					stdin = true,
				}
			end,
		},
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--single-quote",
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
		markdown = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--parser",
						"markdown",
					},
					stdin = true,
				}
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
				return { exe = "shfmt", args = { "-p" }, stdin = true }
			end,
		},
		yaml = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--parser",
						"yaml",
					},
					stdin = true,
				}
			end,
		},
	},
})
