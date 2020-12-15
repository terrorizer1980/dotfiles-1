" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["ack.vim"] = {
    commands = { "Ack" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/ack.vim"
  },
  ale = {
    config = { "require('plugins.ale')" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/ale"
  },
  ["completion-nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["nvim-lspconfig"] = {
    after = { "completion-nvim" },
    config = { "require('lsp')" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    commands = { "Luadev" },
    config = { "require('plugins.nvim-luadev')" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["tmuxline.vim"] = {
    commands = { "Tmuxline" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/tmuxline.vim"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/nick/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: tmuxline.vim
require('plugins.tmuxline')
-- Post-load configuration
-- Config for: telescope.nvim
require('plugins.telescope')
-- Config for: vim-floaterm
require('plugins.floaterm')
-- Config for: nvim-web-devicons
require('nvim-web-devicons').setup({})
-- Config for: vim-which-key
require('plugins.vim-which-key')
-- Config for: iceberg.vim
vim.cmd('colorscheme iceberg')
-- Config for: lightline.vim
require('plugins.lightline')
-- Config for: vim-startify
require('plugins.startify')
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Make call s:load(['vim-dispatch'], { "cmd": "Make", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Focus call s:load(['vim-dispatch'], { "cmd": "Focus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Ack call s:load(['ack.vim'], { "cmd": "Ack", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Luadev call s:load(['nvim-luadev'], { "cmd": "Luadev", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Start call s:load(['vim-dispatch'], { "cmd": "Start", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Tmuxline call s:load(['tmuxline.vim'], { "cmd": "Tmuxline", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dispatch call s:load(['vim-dispatch'], { "cmd": "Dispatch", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType lua ++once call s:load(['nvim-lspconfig'], { "ft": "lua" })
  au FileType javascript ++once call s:load(['ale'], { "ft": "javascript" })
  au FileType typescript ++once call s:load(['ale'], { "ft": "typescript" })
  au FileType elixir ++once call s:load(['nvim-lspconfig'], { "ft": "elixir" })
  au FileType html ++once call s:load(['ale'], { "ft": "html" })
  au FileType css ++once call s:load(['ale'], { "ft": "css" })
  au FileType json ++once call s:load(['ale'], { "ft": "json" })
  " Event lazy-loads
augroup END
