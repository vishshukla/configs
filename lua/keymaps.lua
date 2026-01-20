local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- ============================================
-- Leader Key
-- ============================================
keymap("", "<Space>", "<Nop>", opts)

-- ============================================
-- Normal Mode
-- ============================================

-- Window navigation (Ctrl + hjkl to move between splits)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize (Ctrl + arrow keys)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation (Shift + hl to cycle through open files)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

-- Move line up/down (Alt + jk)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- ============================================
-- Insert Mode
-- ============================================
-- ============================================
-- Visual Mode
-- ============================================

-- Stay in indent mode (keep selection after indenting)
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up/down (Alt + jk)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste without yanking replaced text
keymap("v", "p", '"_dP', opts)

-- ============================================
-- Visual Block Mode
-- ============================================

-- Move text up/down (J/K or Alt + jk)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- ============================================
-- Terminal Mode (uncomment if needed)
-- ============================================
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- ============================================
-- Telescope (fuzzy finder)
-- ============================================

-- File finding
keymap("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
keymap("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find recent files" })
keymap("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })

-- Searching
keymap("n", "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end, { desc = "Live grep" })
keymap("n", "<leader>fc", function() require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"}) end, { desc = "Live grep (no tests)" })
keymap("n", "<leader>fw", function() require("telescope.builtin").grep_string() end, { desc = "Find word under cursor" })
keymap("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
    layout_config = { width = 0.7 },
  }))
end, { desc = "Fuzzy search in buffer" })

-- LSP & help
keymap("n", "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Find symbols" })
keymap("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help" })
keymap("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })

-- Git
keymap("n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "Git commits" })
keymap("n", "<leader>gb", function() require("telescope.builtin").git_bcommits() end, { desc = "Git commits (buffer)" })
keymap("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "Git search" })
