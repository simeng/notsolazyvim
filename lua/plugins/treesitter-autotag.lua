return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		opts = {
			enable_close = false,
			enable_close_on_slash = false,
		},
	},
}
