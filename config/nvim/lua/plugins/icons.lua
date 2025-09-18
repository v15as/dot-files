return{
	'kyazdani42/nvim-web-devicons',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup()
		end,
	},
	'echasnovski/mini.icons'

}
