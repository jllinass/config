return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		-- Navegar al buffer siguiente / anterior
		{ "bn", "<cmd>BufferLineCycleNext<cr>", desc = "Siguiente buffer" },
		{ "bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Anterior buffer" },

		-- Mover el buffer actual a la izquierda / derecha en la barra
		{ "<leader>bmn", "<cmd>BufferLineMoveNext<cr>", desc = "Mover buffer a la derecha" },
		{ "<leader>bmp", "<cmd>BufferLineMovePrev<cr>", desc = "Mover buffer a la izquierda" },

		-- Cerrar el buffer actual
		{ "<leader>bd", "<cmd>bdelete!<cr>", desc = "Cerrar buffer actual" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Cerrar otros buffers" },

		-- Saltar directamente a los primeros buffers por número (1-9)
		{ "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Ir al buffer 1" },
		{ "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Ir al buffer 2" },
		{ "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Ir al buffer 3" },
		{ "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Ir al buffer 4" },
		{ "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Ir al buffer 5" },
		{ "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Ir al buffer 6" },
		{ "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Ir al buffer 7" },
		{ "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Ir al buffer 8" },
		{ "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Ir al buffer 9" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "ordinal",
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
