vim.g.mapleader = " ";
local keymap = vim.keymap;

-- ---------- 插入模式 ---------- ---


-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv");
keymap.set("v", "K", ":m '<-2<CR>gv=gv");

-- ---------- 视觉模式 ---------- ---
-- 窗口
-- keymap.set("n", "<leader>sv", "<C-w>v");
-- keymap.set("n", "<leader>sh", "<C-w>s");

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>");
-- buffer
keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>");
keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>");
keymap.set('n', '<leader>w', function()
    if vim.bo.modified then
        vim.cmd.write()
    end
    local buf = vim.fn.bufnr()
    require("bufferline").cycle(-1)
    vim.cmd.bdelete(buf)
end);
-- lsp-config
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float);
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev);
vim.keymap.set('n', ']d', vim.diagnostic.goto_next);
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist);


