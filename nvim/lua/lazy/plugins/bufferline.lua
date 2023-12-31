return {
    {
        "akinsho/bufferline.nvim",
        init = function()
            vim.opt.termguicolors =  true
        end,
        config = function()
            require("bufferline").setup {
                options = {
                    diagnostics = "nvim_lsp",
                    offsets = {{
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left"
                    }}
                }
            }
        end,
    }
}
