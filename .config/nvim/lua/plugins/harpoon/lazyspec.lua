return {

	-- super fast search
	{
		enabled = true,
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	},
}
