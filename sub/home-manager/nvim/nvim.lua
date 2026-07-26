-- Basic options
vim.g.mapleader = " "

vim.opt.title = true
vim.opt.hidden = true
vim.opt.ruler = false
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.hlsearch = true
vim.opt.shiftwidth = 0
vim.opt.laststatus = 0
vim.opt.encoding = "utf-8"
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Automatically switch a buffer name when the target file is not readable or writable
vim.g.suda_smart_edit = 1

-- Arabic support
vim.opt.termbidi = true

-- Filetype plugin
vim.cmd("filetype plugin on")

-- Colorscheme
vim.opt.background = "dark"
vim.cmd("syntax on")
vim.cmd("colorscheme monokai-pro")

-- Show spaces and tabs
vim.opt.listchars = "tab:--,space:·"

-- Autocompletion
vim.opt.wildmode = "longest,list,full"

-- Mappings
vim.keymap.set("n", "<leader><leader>w", ":set list!<CR>", { noremap = true })

-- Toggle hidden all function (hides airline and other stuff)
local hidden_all = 0
function ToggleHiddenAll()
    if hidden_all == 0 then
        vim.opt.showmode = false
        vim.opt.ruler = false
        vim.opt.laststatus = 0
        vim.opt.showcmd = false
        hidden_all = 1
    else
        vim.opt.showmode = true
        vim.opt.ruler = true
        vim.opt.laststatus = 2
        vim.opt.showcmd = true
        hidden_all = 0
    end
end
vim.keymap.set("n", "<leader>h", ToggleHiddenAll, { noremap = true })

-- Automatically delete trailing whitespace and newlines
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local currPos = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\n\+\%$//e]])
        local file = vim.fn.expand("%:t")
        if file:match("%.[ch]$") then
            vim.cmd([[%s/\%$/\r/e]])
        end
        vim.fn.cursor(currPos[2], currPos[3])
    end,
})

-- Convert entire file to spaces (tabs → spaces)
vim.api.nvim_create_user_command('ToSpaces', function()
    local ts = vim.opt.tabstop:get()
    vim.cmd('set expandtab')
    vim.cmd('retab!')
    vim.opt.tabstop = ts   -- restore original if needed
    print('Converted to spaces (tabstop = ' .. ts .. ')')
end, { bang = true })

-- Convert entire file to tabs (spaces → tabs)
vim.api.nvim_create_user_command('ToTabs', function()
    local ts = vim.opt.tabstop:get()
    -- First normalise to spaces, then to tabs (handles mixed input)
    vim.cmd('set expandtab')
    vim.cmd('retab!')
    vim.cmd('set noexpandtab')
    vim.cmd('retab!')
    vim.opt.tabstop = ts
    print('Converted to tabs (tabstop = ' .. ts .. ')')
end, { bang = true })

-- Turns off highlighting on the bits of code that are changed in diff mode
if vim.opt.diff:get() then
    vim.cmd("highlight! link DiffText MatchParen")
end
