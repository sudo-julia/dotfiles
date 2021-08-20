require('lint').linters_by_ft = {
  bash = {'shellcheck',},
  lua = {'luacheck',},
  markdown = {'markdownlint'},
  python = {'flake8', 'mypy', 'pylint'},
}
