local exists, galaxyline = pcall(require, 'galaxyline')

if not exists then return end

local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')

local fn = vim.fn

galaxyline.short_line_list = {'NvimTree', 'vista', 'packer'}

local pal = vim.g.ngs_palette

local mode_pal = {
  normal   = pal.blue,
  visual   = pal.purple,
  select   = pal.orange,
  insert   = pal.green,
  complete = pal.magenta,
  replace  = pal.red,
  command  = pal.cyan,
  ex       = pal.yellow,
  prompt   = pal.blue,
  shell    = pal.cyan,
  terminal = pal.cyan,
}

local mode_settings = {
  n        = {'NORMAL',   mode_pal.normal},
  no       = {'NORMAL',   mode_pal.normal},
  nov      = {'NORMAL',   mode_pal.normal},
  noV      = {'NORMAL',   mode_pal.normal},
  ['no^V'] = {'NORMAL',   mode_pal.normal},
  niI      = {'NORMAL',   mode_pal.normal},
  niR      = {'NORMAL',   mode_pal.normal},
  niV      = {'NORMAL',   mode_pal.normal},
  v        = {'VISUAL',   mode_pal.visual},
  V        = {'V-LINE',   mode_pal.visual},
  ['']   = {'V-BLOCK',  mode_pal.visual},
  s        = {'SELECT',   mode_pal.select},
  S        = {'S-LINE',   mode_pal.select},
  ['']   = {'S-BLOCK',  mode_pal.select},
  i        = {'INSERT',   mode_pal.insert},
  ic       = {'COMPLETE', mode_pal.insert},
  ix       = {'COMPLETE', mode_pal.insert},
  R        = {'REPLACE',  mode_pal.replace},
  Rc       = {'REPLACE',  mode_pal.replace},
  Rv       = {'REPLACE',  mode_pal.replace},
  Rx       = {'REPLACE',  mode_pal.replace},
  c        = {'COMMAND',  mode_pal.replace},
  cv       = {'EX',       mode_pal.ex},
  ce       = {'EX',       mode_pal.ex},
  r        = {'ENTER...', mode_pal.prompt},
  rm       = {'MORE...',  mode_pal.prompt},
  ['r?']   = {'CONFIRM',  mode_pal.prompt},
  ['!']    = {'SHELL',    mode_pal.shell},
  t        = {'TERMINAL', mode_pal.terminal},
}

galaxyline.section.left = {
  {
    ModeLabel = {
      provider = function()
        local setting = mode_settings[fn.mode()]
        local mode_color = setting[2]
        if mode_color == '' then mode_color = 'red' end
        vim.cmd('hi GalaxyModeLabel guibg=' .. mode_color)
        vim.cmd('hi GalaxyModeSeparator guifg=' .. mode_color)
        return string.format('  %s ', setting[1])
      end,
      highlight = {pal.black, pal.bg},
      separator = ' ',
      separator_highlight = {pal.gray, pal.gray},
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, pal.gray},
    },
  },
  {
    FileName = {
      provider = function()
        return fileinfo.get_current_file_name()
      end,
      condition = condition.buffer_not_empty,
      highlight = {pal.fg, pal.gray}
    }
  },
  {
    DiffSeparator = {
      provider = function() return '   ' end,
      highlight = {pal.bg, pal.bg},
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {pal.green, pal.bg},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {pal.yellow, pal.bg},
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {pal.red, pal.bg},
    }
  }
}

galaxyline.section.right = {
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {pal.red, pal.bg}
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {pal.yellow, pal.bg},
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {pal.cyan, pal.bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {pal.blue, pal.bg},
    }
  },
  {
    GitIcon = {
      -- provider = function() return '   ' end,
      provider = function() return '   ' end,
      condition = condition.check_git_workspace,
      highlight = {pal.fg, pal.bg},
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      highlight = {pal.fg, pal.bg},
    }
  },
  {
    CursorPosition = {
      provider = function ()
        local linecol = fileinfo.line_column()
        local percent = fileinfo.current_line_percent()
        return string.format(' %s %s☰ ', linecol, percent)
      end,
      highlight = {pal.fg, pal.gray},
      separator = ' ',
      separator_highlight = {pal.fg, pal.bg},
    },
  },
}

galaxyline.section.short_line_left = {
  {
    SLeftGutter = {
      provider = function() return ' ' end,
      highlight = {pal.bg, pal.bg},
    }
  },
  {
    SFileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {pal.fg, pal.bg},
    },
  },
  {
    SFileName = {
      provider = function()
        return fileinfo.get_current_file_name()
      end,
      condition = condition.buffer_not_empty,
      highlight = {pal.fg, pal.bg}
    }
  },
}
