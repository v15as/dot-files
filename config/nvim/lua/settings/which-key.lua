
local wk = require("which-key")

wk.add({
    {"<leader>ex","<CMD>Ex<Cr>", desc = "Exit", mode = "n"},
    {"<leader>w", "<CMD>update<Cr>", desc = "Save", mode = {"n", "v"}},
    {"<leader>W", "<cmd>wall<cr>", desc = "Save all buffers", mode = {"n", "v"}},
    {"<leader>[", "<CMD>bp<Cr>", desc = "Previous buffer"},
    {"<leader>]", "<CMD>npCr>", desc = "Next buffer"},
    {"<leader>H", "<CMD>Telescope help_tags<cr>", desc = "Telescope help tags"},
    {"<leader>r", "<CMD>Telescope live_grep<Cr>", desc = "Live grep"},
    {"<leader>b", "<CMD>Telescope buffers<Cr>", desc = "Telescope buffers"},
    {"<leader>P", "<CMD>Telescope find_files<Cr>", desc = "File finder"},
    {"<leader>c", "<CMD>Telescope git_status<Cr>", desc = "Changed Files in git repo"},

    -- {"<C-t>", "<CMD>ToggleTerm<Cr>", desc = "Terminal"},

    {"gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration"},
    {"gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition"},
    {"gK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
    {"gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Previous buffer"},
    {"gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Next buffer"},
    {"gnn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename (nn = new name)"},
    {"gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action"},
    {"gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show error message"},
})
