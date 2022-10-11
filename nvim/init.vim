call plug#begin('~/.vim/plugged')

" Themes
Plug 'itchyny/lightline.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'joshdick/onedark.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Files
" Nerdtre
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'preservim/nerdtree'

" Web stuff:

" coc for auto completion - TODO Switch to native lsp later?: https://github.com/neovim/nvim-lspconfig/wiki/Comparison-to-other-LSP-ecosystems-(CoC,-vim-lsp,-etc.)
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" TODO: Prettier
" https://prettier.io/docs/en/vim.html
" Plug 'sbdchd/neoformat'

" Ident lines
Plug 'Yggdroot/indentLine'

" Zen mode stuff
"Plug 'smithbm2316/centerpad.nvim' " Does work, but resets with NERDtree
" Plug 'junegunn/goyo.vim' not good enough
"Plug 'folke/zen-mode.nvim'

" Toggle comments
Plug 'tpope/vim-commentary'

" Surround stuff like '', (), {} and so on
"Plug 'tpope/vim-surround'

"automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" git diff integration
Plug 'airblade/vim-gitgutter'

"git diff
Plug 'sindrets/diffview.nvim'

" Telescope
" https://github.com/nvim-telescope/telescope.nvim#getting-started
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'

Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

" Vim Glow -> markdown preview
Plug 'ellisonleao/glow.nvim'

" cheat.sh
" Use with <Leader>KK, <Leader>KP, <Leader>KR, <Leader>KC
Plug 'dbeniamine/cheat.sh-vim'

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


syntax enable
set number
set shiftwidth=4
set tabstop=4
set ignorecase
set smartindent
set cursorline
set ruler
set updatetime=300
set signcolumn=yes
set noshowmode

" Autosave on focus loss
:au FocusLost * :wa
colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" Yank and paste with the system clipboard
set clipboard=unnamedplus

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
" ----------------------------- General stuff

"  Binds ----------------------------------
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT
nnoremap <F4> :q<CR>
nnoremap <leader>t <cmd>tabnew<cr>
nnoremap <leader>p :Glow<CR>

" Telescope: Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope session-lens search_session<cr>

" Coc:::::::::::::::::::::::
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <Tab> coc#pum#confirm()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Lightline config with coc stuff
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }
" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" :::::::::::::::Coc
"  ---------------------------------- Binds

" NERDTree stuff ----------------------------
nnoremap <f1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeFind<CR>
nnoremap <f10> :NERDTree ~/Nextcloud/Notes<CR>
" Close NERDtree after opening file
let NERDTreeQuitOnOpen = 1
" Close last remaining tab if it's nerdtree
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
" ---------------------------- NERDTree stuff
