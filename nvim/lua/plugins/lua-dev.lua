-- local on_attach = require('plugins.lspconfig').on_attach
local sumneko_root_path = vim.fn.stdpath('data') .. '/lsp_servers/lua'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local luadev = require('lua-dev').setup {
  lspconfig = {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
      Lua = {
        runtime = {path = runtime_path},
        workspace = {
          library = {library = vim.api.nvim_get_runtime_file('', true)}
        },
        telemetry = {enable = false}
      }
    }
  }
}

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
