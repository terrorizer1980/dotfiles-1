local _M = {}

local api, cmd = vim.api, vim.cmd

local function apply_default_opts(opts)
    local defaults = {noremap = true}
    if opts then
        return vim.tbl_extend("force", defaults, opts)
    else
        return defaults
    end
end

function _M.map(mode, lhs, rhs, opts)
    local options = apply_default_opts(opts)
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _M.bufmap(buffer, mode, lhs, rhs, opts)
    local options = apply_default_opts(opts)
    api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

function _M.paq_get()
    local url = "https://github.com/savq/paq-nvim"
    local dest = vim.fn.stdpath("data") .. "/site/pack/paqs/opt/paq-nvim"

    if vim.fn.input("Download Paq? (y/N) ") == "y" then
        cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
        print("✔ Paq downloaded successfully")
    end
end

function _M.set(opt, val, scopes)
    for _, scope in ipairs(scopes) do vim[scope][opt] = val end
end

function _M.get_highlight_attr(group, attr)
    local hl_id = vim.fn.hlID(group)
    local syntax_id = vim.fn.synIDtrans(hl_id)
    return vim.fn.synIDattr(syntax_id, attr)
end

function _M.split(str, char)
    local tokens = {}
    char = char or "%s"

    for token in string.gmatch(str, "[^" .. char .. "]+") do
        table.insert(tokens, token)
    end

    return tokens
end

function _M.inspect(obj, opts)
    if opts == nil then opts = {} end
    print(vim.inspect(obj, opts))
end

function _M.augroup(name, defs)
    cmd("augroup " .. name)
    cmd("autocmd!")
    for _, def in ipairs(defs) do vim.api.nvim_exec("autocmd " .. def, "") end
    cmd("augroup END")
end

function _M.globally_exists(name)
    if _G[name] then
        return true
    else
        return false
    end
end

function _M.join_paths(...) return table.concat({...}, "/") end

function _M.highlight(group, opts)
    local fg = opts.fg or "NONE"
    local bg = opts.bg or "NONE"
    local attrs = opts.attrs or "NONE"
    local command = string.format("highlight %s gui=%s guifg=%s guibg=%s",
                                  group, attrs, fg, bg)
    cmd(command)
end

function _M.toggle_qflist()
    for _, winnr in ipairs(vim.api.nvim_list_wins()) do
        if vim.fn.getwininfo(winnr)[1].quickfix then
            cmd("cclose")
            return
        end
    end
    cmd("copen")
end

function _M.toggle_line_numbers()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end

function _M.toggle_sign_column()
    if vim.wo.signcolumn == "yes" then
        vim.wo.signcolumn = "no"
    else
        vim.wo.signcolumn = "yes"
    end
end

return _M
