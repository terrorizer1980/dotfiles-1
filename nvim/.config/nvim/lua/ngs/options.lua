-- ==========================================================
-- Options
-- ==========================================================

local set = require("ngs.util").set

local fillchars = vim.o.fillchars .. "vert:│"
local grepprg   = [[rg --vimgrep]]
local listchars = "tab:>-,eol:↵,nbsp:␣,trail:‧,extends:⟩,precedes:⟨"
local shortmess = vim.o.shortmess .. "c"

set("cursorline",     true,      {"o", "wo"}) -- Highlight the screen line of the cursor with CursorLine
set("expandtab",      true,      {"o", "bo"}) -- Use the appropriate number of spaces to insert a <Tab>
set("fillchars",      fillchars, {"o"})       -- Characters to fill the statuslines and vertical separators
set("foldlevel",      99,        {"o", "wo"}) -- Don"t open files with folds closed
set("foldmethod",     "syntax",  {"o", "wo"}) -- Syntax defines folds
set("grepprg",        grepprg,   {"o"})       -- Use ripgrep backend for the `:grep` command
set("ignorecase",     true,      {"o"})       -- Ignore case in search patterns
set("hidden",         true,      {"o"})       -- Don"t unload buffers when they become abandoned
set("inccommand",     "split",   {"o"})       -- Show off-screen substitutions in a preview window
set("listchars",      listchars, {"o"})       -- Set characters for drawing whitespace
set("number",         true,      {"o", "wo"}) -- Print the line number in front of the current line
set("relativenumber", true,      {"o", "wo"}) -- Show cursor-relative line number in front of each line
set("scrolloff",      10,        {"o"})       -- Keep at least 10 screen lines above and below the cursor
set("shiftwidth",     2,         {"o", "bo"}) -- Number of spaces to use for each step of (auto)indent
set("shortmess",      shortmess, {"o"})       -- Don"t give `ins-completion-menu` messages
set("showmode",       false,     {"o"})       -- Hide mode indicator
set("signcolumn",     "yes",     {"o", "wo"}) -- Always show the signcolumn
set("smartcase",      true,      {"o"})       -- Override `ignorecase` if pattern has upper case chars
set("smartindent",    true,      {"o", "bo"}) -- Do smart autoindenting when starting a new line
set("softtabstop",    2,         {"o", "bo"}) -- Number of spaces that a <Tab> counts for while editing
set("splitbelow",     true,      {"o"})       -- Vertically splits appear below current window
set("splitright",     true,      {"o"})       -- Vertically splits appear to right of current window
set("tabstop",        2,         {"o", "bo"}) -- Number of spaces that a <Tab> in the file counts for
set("termguicolors",  true,      {"o"})       -- Enables 24-bit RGB color in the `TUI`
set("undofile",       true,      {"o", "bo"}) -- Persist undo history and restore on buffer read
set("undofile",       true,      {"o", "bo"}) -- Persist undo history and restore on buffer read
set("updatetime",     1000,      {"o"})       -- ms after which to trigger swap write and `CursorHold`

-- Improve completion experience:
-- * Use a popup menu to show possible completions
-- * Only show popup menu when there is more than one match
-- * Don’t insert anything until a match is selected
-- * Don’t automatically select a match
vim.o.completeopt = "menu,menuone,noselect"
