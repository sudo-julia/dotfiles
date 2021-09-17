require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	c = { "clangtidy", "cppcheck" },
	css = { "stylelint" },
	html = { "stylelint", "tidy" },
	js = { "eslint" },
	latex = { "chktex" },
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	python = { "flake8", "pylint" }, -- add mypy back sometime
	sh = { "shellcheck" },
}

vim.cmd([[au BufRead,BufWritePost <buffer> lua require('lint').try_lint()]])
