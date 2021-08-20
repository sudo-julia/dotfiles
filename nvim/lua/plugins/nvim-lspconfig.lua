local lspconfig = require("lspconfig")
local map = require("utils").map

--- keybindings
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- mappings
	local opts = { noremap = true, silent = true }
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    map("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

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

--- individual language server setups
-- python
lspconfig.pyright.setup {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      pythonPath = "/usr/bin/python3",
      venvPath = "/home/jam/lib/cache/pypoetry/virtualenvs",
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,
      }
    }
  },
  on_attach = on_attach
}

-- lua
local system_name = "Linux"
local sumneko_root_path = vim.fn.stdpath("data") .. "/lspinstall/lua/sumneko-lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
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
local servers = { "bashls", "tsserver" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach }
end
