return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = { { "<leader>e", ":Neotree toggle<CR>", desc = "Open Tree" } },
        config = function()
            require("neo-tree").setup()
        end,
    }
}
