local uv = vim.loop

local cmd = vim.cmd
local fn = vim.fn
local utils = {}

function utils.create_augroup(autocmds, name)
	cmd("augroup " .. name)
	cmd([[autocmd!]])
	for _, autocmd in ipairs(autocmds) do
		cmd("autocmd " .. table.concat(autocmd, " "))
	end
	cmd([[augroup END]])
end

function utils.iter_dir(fn, dir, args)
	local child, name, t, ok
	local handle = uv.fs_scandir(dir)
	while handle do
		name, t = uv.fs_scandir_next(handle)
		if not name then
			break
		end
		child = dir .. "/" .. name
		ok = fn(child, name, args)
		if not ok then
			return
		end
	end
	return true
end

function utils.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
