return {

	-- Adding toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 13,
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
			autochdir = true,
		},
	},
}
