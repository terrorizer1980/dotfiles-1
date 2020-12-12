local g, w, b = vim.o, vim.wo, vim.bo

local copt = 'menuone,noinsert,noselect'
local gprg =  'rg\\ --vimgrep'
local smss = g.shortmess .. 'c'

-- Global
g.completeopt     = copt      -- Set completeopt to have a better completion experience
g.expandtab       = false     -- Use the appropriate number of spaces to insert a <Tab>
g.fillchars       = 'vert:│'  -- Characters to fill the statuslines and vertical separators
g.grepprg         = gprg      -- Program to use for the `:grep` command
g.hidden          = false     -- Abandon buffers when they become hidden
g.ignorecase      = true      -- Ignore case in search patterns
g.inccommand      = 'split'   -- Show partial off-screen substitutions in a preview window
g.number          = true      -- Print the line number in front of the current line
g.scrolloff       = 10        -- Keep at least 10 screen lines above and below the cursor
g.shiftwidth      = 2         -- Number of spaces to use for each step of (auto)indent
g.shortmess       = smss      -- Don't give `ins-completion-menu` messages
g.showmode        = false     -- Hide mode indicator
g.smartcase       = true      -- Override `ignorecase` if the pattern contains upper case characters
g.smartindent     = false     -- Do smart autoindenting when starting a new line
g.softtabstop     = 2         -- Number of spaces that a <Tab> counts for while editing
g.splitbelow      = true      -- Vertically splits appear below the current window
g.splitright      = true      -- Vertically splits appear to the right of the current window
g.tabstop         = 2         -- Number of spaces that a <Tab> in the file counts for
g.termguicolors   = true      -- Enables 24-bit RGB color in the `TUI`
g.undofile        = true      -- Persist undo history and restore on buffer read
g.updatetime      = 1000      -- Milliseconds after which to trigger swap write/`CursorHold`

-- Window
w.cursorline      = true      -- Highlight the screen line of the cursor with CursorLine
w.foldmethod      = 'marker'  -- Markers are used to specify folds
w.relativenumber  = true      -- Show the cursor-relative line number in front of each line
w.signcolumn      = 'yes:2'   -- Always show the signcolumn with two spaces

-- Buffer
b.swapfile        = false     -- Don't use swapfiles
