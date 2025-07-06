local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local mappings = {
  -- ═══════════════════════════════════════════
  -- Search & Esc behavior
  -- ═══════════════════════════════════════════
  { "n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" } },

  -- ═══════════════════════════════════════════
  -- Quickfix list navigation
  -- ═══════════════════════════════════════════
  { "n", "[q", ":cp<CR>", { desc = "Previous quickfix item" } },
  { "n", "]q", ":cn<CR>", { desc = "Next quickfix item" } },
  { "n", "<Leader>qo", ":copen<CR>", { desc = "Open quickfix list" } },
  { "n", "<Leader>qc", ":cclose<CR>", { desc = "Close quickfix list" } },

  -- ═══════════════════════════════════════════
  -- Tabs
  -- ═══════════════════════════════════════════
  { "n", "<Leader>tc", ":tabclose<CR>", { desc = "Close tab" } },
  { "n", "<Leader>tn", ":tabn<CR>", { desc = "Next tab" } },
  { "n", "<Leader>tp", ":tabp<CR>", { desc = "Previous tab" } },

  -- ═══════════════════════════════════════════
  -- Buffer navigation & close
  -- ═══════════════════════════════════════════
  { "n", "[b", ":bp<CR>", { desc = "Previous buffer" } },
  { "n", "]b", ":bn<CR>", { desc = "Next buffer" } },
  { "n", "[B", ":bf<CR>", { desc = "First buffer" } },
  { "n", "]B", ":bl<CR>", { desc = "Last buffer" } },
  { "n", "<leader>qw", "<cmd>:bd<CR>", { desc = "Close current buffer" } },

  -- ═══════════════════════════════════════════
  -- Split navigation & resizing
  -- ═══════════════════════════════════════════
  { "n", "<C-h>", "<C-w>h", { desc = "Move to left split" } },
  { "n", "<C-j>", "<C-w>j", { desc = "Move to below split" } },
  { "n", "<C-k>", "<C-w>k", { desc = "Move to above split" } },
  { "n", "<C-l>", "<C-w>l", { desc = "Move to right split" } },
  { "n", "<C-S-Left>", ":vertical resize +3<CR>", { desc = "Resize split left" } },
  { "n", "<C-S-Right>", ":vertical resize -3<CR>", { desc = "Resize split right" } },
  { "n", "<C-S-Up>", ":resize +3<CR>", { desc = "Resize split up" } },
  { "n", "<C-S-Down>", ":resize -3<CR>", { desc = "Resize split down" } },

  -- ═══════════════════════════════════════════
  -- Text movement
  -- ═══════════════════════════════════════════
  { "v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" } },
  { "v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" } },
  { "n", "J", "mzJ`z", { desc = "Join lines and keep cursor" } },

  -- ═══════════════════════════════════════════
  -- Scrolling behavior
  -- ═══════════════════════════════════════════
  { "n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" } },
  { "n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" } },
  { "n", "n", "nzzzv", { desc = "Next match and center" } },
  { "n", "N", "Nzzzv", { desc = "Previous match and center" } },

  -- ═══════════════════════════════════════════
  -- Yank & delete overrides
  -- ═══════════════════════════════════════════
  { "x", "<leader>p", [["_dP]], { desc = "Paste without yanking selection" } },
  { { "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void register" } },
  { { "n", "v" }, "<leader>c", [["_c]], { desc = "Change to void register" } },
  { { "n", "v" }, "<leader>x", [["_x]], { desc = "Cut to void register" } },
  { { "n", "v" }, "<leader>D", [["_D]], { desc = "Delete line to void register" } },
  { { "n", "v" }, "<leader>C", [["_C]], { desc = "Change line to void register" } },

  -- ═══════════════════════════════════════════
  -- Substitution helpers
  -- ═══════════════════════════════════════════
  { "n", "<leader>Si", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute current word [I]nsensitive" } },
  { "n", "<leader>Sc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = "[S]ubstitute current word [C]onfirm" } },
  { "v", "<leader>Si", [["hy:%s/<C-r>h/<C-r>h/gI<left><left><left>]], { desc = "[S]ubstitute selection [I]nsensitive" } },
  { "v", "<leader>Sc", [["hy:%s/<C-r>h/<C-r>h/gIc<left><left><left><left>]], { desc = "[S]ubstitute selection [C]onfirm" } },

  -- ═══════════════════════════════════════════
  -- File & clipboard
  -- ═══════════════════════════════════════════
  { "n", "<Leader>cp", ':let @+ = expand("%:.")<CR>', { desc = "Copy relative path to clipboard" } },
  { "n", "<Leader>cf", ':let @+ = expand("%:t")<CR>', { desc = "Copy filename to clipboard" } },
  { "n", "<leader>ft", ":set filetype=", { desc = "Set filetype manually" } },

  -- ═══════════════════════════════════════════
  -- System commands
  -- ═══════════════════════════════════════════
  { "n", "<leader>X", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" } },
  { "n", "<leader>R", "<cmd>!(cd ~/.env_config/ && stow -R .)<CR>", { desc = "Re-stow dotfiles" } },

  -- ═══════════════════════════════════════════
  -- Plugin: FileExplorer
  -- ═══════════════════════════════════════════
  { "n", "<leader>pv", ":NvimTreeFindFileToggle <CR>", { desc = "Toggle NERDTree with current file" } },

  -- ═══════════════════════════════════════════
  -- Insert mode enhancements
  -- ═══════════════════════════════════════════
  { "i", "jk", "<ESC>", { desc = "Escape insert mode" } },
  { "i", "<M-BS>", "<C-W>", { desc = "Delete word in insert mode" } },
}

for _, map in ipairs(mappings) do
  local mode, lhs, rhs, opt = unpack(map)
  keymap(mode, lhs, rhs, opt or opts)
end
