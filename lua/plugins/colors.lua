local function enable_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
	"folke/tokyonight.nvim",
	priority = 1000, -- ważne: kolory zanim UI się zainicjuje
	config = function()
	    vim.cmd.colorscheme("tokyonight")
	    enable_transparency()
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
	    require("lualine").setup({
		options = {
		    theme = "tokyonight",
		},
	    })
	end,
    },
    {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    -- optional but recommended
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'zig make' },
	},
	config = function()
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files in git' })
	    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end
    }

}
