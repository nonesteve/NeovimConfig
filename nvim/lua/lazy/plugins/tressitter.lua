return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
        ensure_installed = "all",
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    },
    config = function()
        require 'nvim-treesitter.configs'.setup{}
    end




}
