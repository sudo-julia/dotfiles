local map = require("utils").map

local M = {}

M.on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

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
	map("n", "g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
	map("n", "g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
	map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
	map("n", "<Leader>fo", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

-- TODO: there's definitely a way to do this with variables
M.on_attach_no_format = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

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
	map("n", "g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
	map("n", "g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
	map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
	map("n", "<Leader>fo", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

return M
