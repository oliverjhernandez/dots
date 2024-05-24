return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			enable = true,
			input_after_comment = true,
			snippet_engine = "luasnip",
		},
	},
}
