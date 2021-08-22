local map = require('utils').map
local lspconfig = require('lspconfig')

--- keybindings
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- mappings
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")

  --[[ -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end
  if client.resolved_capabilities.document_range_formatting then
    map("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end
 ]]
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

lspconfig.bashls.setup {
  filetypes = {'bash', 'sh'}
}

lspconfig.pyright.setup {
  settings = {
    python = {
      pythonPath = '/usr/bin/python3',
      venvPath = '/home/jam/lib/cache/pypoetry/virtualenvs',
      analysis = {
        useLibraryCodeForTypes = true,
      }
    }
  },
  on_attach = on_attach
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/lua/sumneko-lua-language-server' };
  settings = {
    Lua = {
      runtime = {
        path = runtime_path
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          library = vim.api.nvim_get_runtime_file("", true)
        }
      },
      telemetry = {
        enable = false,
      }
    }
  },
  on_attach = on_attach
}

-- set up all servers that require no extra configuration
local servers = {'bashls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({ on_attach = on_attach })
end
