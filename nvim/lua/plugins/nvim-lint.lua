require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	c = { "clangtidy", "cppcheck" },
	html = { "tidy" },
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	python = { "flake8", "mypy", "pylint" },
	sh = { "shellcheck" },
}

vim.cmd([[au BufRead,BufWritePost <buffer> lua require('lint').try_lint()]])
