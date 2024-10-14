local opt = vim.opt;

-- 行号
-- opt.relativenumber = true;
opt.number = true;

-- 缩进
opt.tabstop = 4;
opt.shiftwidth = 4;
opt.expandtab = true;
opt.autoindent = true;

-- 防止包裹
opt.wrap = false;

-- 光标行
opt.cursorline = true;

-- 启用鼠标
opt.mouse:append("a");

-- 系统剪切板
opt.clipboard:append("unnamedplus");

-- 默认新窗口位置右下
opt.splitright = true;
opt.splitbelow = true;

-- 外观
opt.termguicolors = true;
opt.signcolumn = "yes";
vim.cmd [[colorscheme dracula]];

-- 自动保存会话内容
opt.sessionoptions = "buffers,curdir,tabpages,winsize";
-- 自动保存路径及其文件名设置
local path = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/");
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.fn.mkdir(path, "p");
        vim.cmd("mks! " .. path .. vim.fn.sha256(vim.fn.getcwd()) .. ".vim")
    end
});
-- 自动保存恢复命令
vim.api.nvim_create_user_command("Resume", function()
    local file = path .. vim.fn.sha256(vim.fn.getcwd()) .. ".vim";
    if vim.fn.filereadable(file) ~= 0 then
        vim.cmd.source(file);
    end
end, {});
-- 恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local line = vim.fn.line('\'"');
        if line > 1 and line <= vim.fn.line("$") then
            vim.cmd.normal('g\'"');
        end
    end
});
-- clipboard
function my_paste(reg)
    return function(lines)
        --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')
    end
end

if (os.getenv('SSH_TTY') == nil)
then
    --[ 当前环境为本地环境，也包括 wsl ]
    opt.clipboard:append("unnamedplus")
else
    opt.clipboard:append("unnamedplus")
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
        ["+"] = my_paste("+"),
        ["*"] = my_paste("*"),


    },
}
end
