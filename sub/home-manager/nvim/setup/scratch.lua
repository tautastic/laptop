local fzf_lua = require("fzf-lua")

-- Open a new scratch buffer with the given filetype
local function open_scratch_buffer(filetype)
    -- Timestamp for unique filename
    local date_time = os.date("%Y-%m-%d_%H-%M-%S")
    local scratch_dir = vim.fn.expand("~/.cache/scratches/")
    local filename = scratch_dir .. date_time .. "." .. filetype

    -- Ensure the directory exists
    vim.fn.mkdir(scratch_dir, "p")

    -- Open a vertical split with the new file
    vim.cmd("vnew " .. vim.fn.fnameescape(filename))

    -- Set filetype for syntax highlighting
    vim.api.nvim_buf_set_option(0, "filetype", filetype)

    -- Write the file to disk (empty, but creates the file)
    vim.cmd("write")
end

local function get_filetype_list()
    local syntax_files = vim.fn.globpath(vim.fn.getenv("VIMRUNTIME"), "syntax/*.vim", false, true)
    local filetypes = {}
    for _, path in ipairs(syntax_files) do
        local ft = path:match("syntax[/\\](.+)%.vim$")
        if ft then
            table.insert(filetypes, ft)
        end
    end
    return filetypes
end

-- Main function: select a filetype via fzf and create a scratch buffer
local function select_filetype_and_create_scratch()
    local filetypes = get_filetype_list()
    fzf_lua.fzf_exec(filetypes, {
        prompt = "Filetypes> ",
        actions = {
            default = function(selected)
                if selected and #selected > 0 then
                    open_scratch_buffer(selected[1])
                end
            end,
        },
    })
end

vim.keymap.set("n", "<leader>t", select_filetype_and_create_scratch, { noremap = true, desc = "Create scratch buffer with chosen filetype" })
