local opts = { noremap = true, silent = true  }
-- local term_opts = { silent = true }

local autocmd = vim.api.nvim_create_autocmd

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

autocmd('cursorhold', { command = 'set nohlsearch' })



-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",


-- tmux
vim.keymap.set("n", "<c-s> H", [[<cmd>lua require("tmux").resize_left()<cr>]], opts)
vim.keymap.set("n", "<c-s> J", [[<cmd>lua require("tmux").resize_bottom()<cr>]], opts)
vim.keymap.set("n", "<c-s> K", [[<cmd>lua require("tmux").resize_top()<cr>]], opts)
vim.keymap.set("n", "<c-s> L", [[<cmd>lua require("tmux").resize_right()<cr>]], opts)

-- toggleterm 
vim.keymap.set("n", "<F5>", [[<cmd>w<cr><cmd>TermExec cmd='python %'<cr>]], opts)
vim.keymap.set("n", "<leader><leader>c", [[<cmd>ToggleTermSendCurrentLine<cr>]], opts)
-- keymap("n", "<leader><leader>v", [[<cmd>ToggleTermSendVisualLines <T_ID> <cr>]], opts)
-- keymap("n", "<leader><leader>v", [[<cmd>ToggleTermSendVisualSelection <T_ID><cr>]], opts)


-- nvim-tree file explorer
vim.keymap.set("n", "<F2>", "<cmd>NvimTreeToggle<cr>", opts)

-- symbols_outline
vim.keymap.set("n", "<F3>", "<cmd>SymbolsOutline<cr>", opts)


-- trouble
vim.keymap.set("n", "<F4>", "<cmd>TroubleToggle<cr>", opts)
-- vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
--   {silent = true, noremap = true}
-- )


-- lspconfig
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- hover
vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})


-- telescope fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim-bookmarks
vim.keymap.set('n', 'ma', "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>", opts)
vim.keymap.set('n', 'ml', "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>", opts)


-- hop jump anywhere
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})

vim.keymap.set('', '<leader>w', function()
    hop.hint_words({ current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<leader>j', function()
    hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<leader>k', function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<leader>s', function()
    hop.hint_char1({ current_line_only = false })
end, {remap=true})

-- FTerm float terminal
-- vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- debug
vim.keymap.set("n", "<F8>", "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.terminate()<cr>", opts)
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.keymap.set("n", "<Leader>db", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
vim.keymap.set("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
vim.keymap.set("n", "<M-k>", "<cmd>lua require'dapui'.eval()<cr>", opts)





