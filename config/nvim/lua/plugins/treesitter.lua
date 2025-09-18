local M = {
	{
		"nvim-treesitter/nvim-treesitter",
                event = 'CursorHold',
                run = ':TSUpdate',
                build = ':TSUpdate',
		config = function()
			require('plugins.treesitter.treesitter')
		end,
	},
	{ 'nvim-treesitter/playground', dependencies = {'nvim-treesitter'} },
	{ 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {'nvim-treesitter'} },
	{ 'nvim-treesitter/nvim-treesitter-refactor',  dependencies = {'nvim-treesitter'}},
	{ 'windwp/nvim-ts-autotag',  dependencies = {'nvim-treesitter'}},
	{ 'JoosepAlviste/nvim-ts-context-commentstring',  dependencies = {'nvim-treesitter'}},
	'mfussenegger/nvim-jdtls'
}

return { M }
