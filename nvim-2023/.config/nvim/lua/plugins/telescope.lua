return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
--		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		build = "make",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	{
	  "AckslD/nvim-neoclip.lua",
	  config = function()
	    require('neoclip').setup()
	  end,
	}
}
