return {
	{
	  'projekt0n/github-nvim-theme',
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
	    require('github-theme').setup({})
	  end,
	},
  {
    'catppuccin/nvim',
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
