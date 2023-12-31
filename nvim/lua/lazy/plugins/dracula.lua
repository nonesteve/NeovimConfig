return {
    {
        "dracula/vim",
        name = "dracula.nvim",
        init = function()
             vim.cmd([[colorscheme dracula]])
        end
    }
}
