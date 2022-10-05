
call plug#begin('~/.vim/plugged')

" Themes
Plug 'itchyny/lightline.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Files
" Nerdtre
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'preservim/nerdtree'

" Web stuff:

" coc for auto completion - TODO Switch to native lsp later: https://github.com/neovim/nvim-lspconfig/wiki/Comparison-to-other-LSP-ecosystems-(CoC,-vim-lsp,-etc.)
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Prettier
" https://prettier.io/docs/en/vim.html
" Plug 'sbdchd/cneoformat'

" Ident lines
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" Zen mode stuff
Plug 'smithbm2316/centerpad.nvim' " Does work, but resets with NERDtree
" Plug 'junegunn/goyo.vim' not good enough
Plug 'folke/zen-mode.nvim'

" Toggle comments
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" Surround stuff like '', (), {} and so on
" https://github.com/tpope/vim-surround
"Plug 'tpope/vim-surround'
"
" git diff integration
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

"git diff
" https://github.com/sindrets/diffview.nvim
Plug 'sindrets/diffview.nvim'

" Telescope
" https://github.com/nvim-telescope/telescope.nvim#getting-started
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
" Vim Glow -> markdown preview
" https://github.com/ellisonleao/glow.nvim
Plug 'ellisonleao/glow.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Coc config from https://eliasjuremalm.com/blog/how-to-get-started-with-vim-for-web-development-in-2021
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Typescript start ------------------------------
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

"------------------------------ Typescript 


" General stuff ------------------------------

let mapleader = " "

" Telescope: Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>p :Glow<CR>

syntax enable
set shiftwidth=4
set tabstop=4
set relativenumber
set ignorecase
set smartindent
set cursorline

" Autosave on focus loss
:au FocusLost * :wa
colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" Yank and paste with the system clipboard
set clipboard=unnamedplus
" ----------------------------- General stuff

"  Binds ----------------------------------
nnoremap <f7> :ZenMode<CR>
nnoremap <f8> :Centerpad 50 10<CR>
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT
nnoremap <F4> :q<CR>
"  ---------------------------------- Binds

" NERDTree stuff ----------------------------
nnoremap <f1> :NERDTreeToggle<CR>
nnoremap <f2> :NERDTree ~/Nextcloud/Notes<CR>
" Close NERDtree after opening file
let NERDTreeQuitOnOpen = 1
" Close last remaining tab if it's nerdtree
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" ---------------------------- NERDTree stuff

" Coc stuff --------------------------------
"
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Tab> coc#pum#confirm()
" -------------------------------- coc stuff

