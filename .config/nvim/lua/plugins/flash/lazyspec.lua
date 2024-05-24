return {

	-- super fast search
	{
		enabled = true,
		"folke/flash.nvim",
		config = function()
			require("flash").setup()
		end,
	},
}
