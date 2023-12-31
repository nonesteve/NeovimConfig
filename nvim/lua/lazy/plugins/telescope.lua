return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep Files"},
        { "<leader>fb", ":Telescope buffers<CR>", desc = "" },
        { "<leader>fh", ":Telescope help_tags<CR>", desc = "" },
    }
}
