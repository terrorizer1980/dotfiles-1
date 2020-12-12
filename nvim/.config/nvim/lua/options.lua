local o, w, b = vim.o, vim.wo, vim.bo

local copt = 'menuone,noinsert,noselect'
local gprg =  'rg\\ --vimgrep'
local smss = o.shortmess .. 'c'

-- Global
o.completeopt     = copt      -- Set completeopt to have a better completion experience
o.expandtab       = false     -- Use the appropriate number of spaces to insert a <Tab>
o.fillchars       = 'vert:│'  -- Characters to fill the statuslines and vertical separators
o.grepprg         = gprg      -- Program to use for the `:grep` command
o.hidden          = false     -- Abandon buffers when they become hidden
o.ignorecase      = true      -- Ignore case in search patterns
o.inccommand      = 'split'   -- Show partial off-screen substitutions in a preview window
o.number          = true      -- Print the line number in front of the current line
o.scrolloff       = 10        -- Keep at least 10 screen lines above and below the cursor
o.shiftwidth      = 2         -- Number of spaces to use for each step of (auto)indent
o.shortmess       = smss      -- Don't give `ins-completion-menu` messages
o.showmode        = false     -- Hide mode indicator
o.smartcase       = true      -- Override `ignorecase` if the pattern contains upper case characters
o.smartindent     = false     -- Do smart autoindenting when starting a new line
o.softtabstop     = 2         -- Number of spaces that a <Tab> counts for while editing
o.splitbelow      = true      -- Vertically splits appear below the current window
o.splitright      = true      -- Vertically splits appear to the right of the current window
o.tabstop         = 2         -- Number of spaces that a <Tab> in the file counts for
o.termguicolors   = true      -- Enables 24-bit RGB color in the `TUI`
o.undofile        = true      -- Persist undo history and restore on buffer read
o.updatetime      = 1000      -- Milliseconds after which to trigger swap write/`CursorHold`

-- Window
w.cursorline      = true      -- Highlight the screen line of the cursor with CursorLine
w.foldmethod      = 'marker'  -- Markers are used to specify folds
w.relativenumber  = true      -- Show the cursor-relative line number in front of each line
w.signcolumn      = 'yes:2'   -- Always show the signcolumn with two spaces

-- Buffer
b.swapfile        = false     -- Don't use swapfiles
