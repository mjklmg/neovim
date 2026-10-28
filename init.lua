local vim = vim

vim.g.mapleader = " "
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.o.winborder = "rounded"

vim.pack.add({
	{src="https://github.com/neovim/nvim-lspconfig"},
	{src="https://github.com/mason-org/mason.nvim"},
	{src="https://github.com/lervag/vimtex" },
	{src="https://github.com/mcncl/alabaster.nvim" },
	{src="https://github.com/nvim-treesitter/nvim-treesitter"}
})

require("nvim-treesitter").setup()
require("nvim-treesitter").install({'lua', 'c'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c' },
  callback = function() vim.treesitter.start() end,
})

vim.cmd.colorscheme("alabaster")
require("alabaster").setup(
	vim.keymap.set("n", "<leader>ct", "<CMD>Alabaster toggle<CR>")
)

require("mason").setup({})
vim.lsp.enable({"lua_ls", "clangd"}) -- :MasonInstall lua-language-server clangd

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("i", "jj", "<ESC>");
vim.keymap.set("n", "<leader>q", "<CMD>:bd!<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<Tab>", '<C-w>w')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<ESC>", "<CMD>nohls<CR>");
vim.keymap.set("n", "-", "<CMD>Ex<CR>");

-- bultin autocompletion, its kinda limited but works
vim.opt.autocomplete = true
vim.opt.complete:append('o')
vim.opt.completeopt = {'menuone', 'noselect'}
