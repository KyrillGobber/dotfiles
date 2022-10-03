local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  conceallevel = 0,                        -- so that `` is visible in markdown files
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
--  showtabline = 2,                         -- always show tabs
  smartindent = true,                      -- make indenting smarter again
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
--  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  :au FocusLost * :wa                      -- auto save file on focus loss



}

