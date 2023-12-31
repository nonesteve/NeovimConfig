return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        keys = { {"<leader>e", ":NvimTreeToggle<CR>", desc = "Open Tree"} },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            require("nvim-tree").setup()
        end,
    }
}
