require('formatter').setup {
  logging = false,
  filetype = {
    bash = {function() return {exe = 'shfmt', stdin = true} end},
    lua = {function() return {exe = 'lua-format', stdin = true} end},
    python = {function() return {exe = 'black', stdin = true} end},
    rust = {
      function()
        return {exe = 'rustfmt', args = {'--emit=stdout'}, stdin = true}
      end
    },
    sh = {function() return {exe = 'shfmt', args = {'-p'}, stdin = true} end}
  }
}
