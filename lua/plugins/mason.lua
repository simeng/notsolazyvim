return {
	{
		"mason-org/mason-lspconfig.nvim",
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { 
                    "lua_ls", 
                    "intelephense", 
                    "tailwindcss-language-server", 
                    "eslint-lsp", 
                    "prettier" 
                },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		init = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
					end
				end,
			})
			vim.cmd("set completeopt+=noselect")
			-- vim.o.winborder = "rounded"
		end,
	},
}
