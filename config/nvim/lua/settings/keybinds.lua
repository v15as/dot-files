local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N',{})

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz', {})
map('n', 'N', 'Nzz', {})

-- Mimic shell movements
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

vim.keymap.set('i','<c-space>', "coc#refresh()", {silent = true, expr = true})
-- Shortcut to yank register
map({ 'n', 'x' }, '<leader>p', '"0p')

-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')

-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
-- To change between windows is <C-WW>
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
-- map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
-- map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- Fast navigation in the file
map('n', '<Up>', '10k')
map('n', '<Down>', '10j')

map('v', '<Up>', '10k')
map('v', '<Down>', '10j')

-- Resize windows
map('n','<Left>','<C-W><')
map('n','<Right>','<C-W>>')

-- Nvim Tree
map('n','<C-n>','<CMD>NvimTreeToggle<Cr>')
map('n','<A-q>','<CMD>tabNext<Cr>')
map('t','<A-q>','<CMD>tabNext<Cr>')


vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
