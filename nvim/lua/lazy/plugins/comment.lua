return {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = { {"gcc"}, {"gc", mode = "v"} },
    config = function()
        require("Comment").setup()
    end
}
