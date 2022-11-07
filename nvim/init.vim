"TODO:
" Telescope method list in file
" onedark lightline Theme
" telescope git stuff!
" git blame?

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
set noswapfile
set showtabline=2
set guioptions-=e
set nocompatible
set termguicolors
set relativenumber

call plug#begin('~/.vim/plugged')

" Themes
Plug 'itchyny/lightline.vim'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'  		" Still testing this
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'			" automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'airblade/vim-gitgutter'		" git diff integration on line numbers!
Plug 'mhinz/vim-signify'            " even better than gitgutter?
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/popup.nvim'			" Telescope dependency
Plug 'nvim-lua/plenary.nvim'		" Telescope dependency
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'kyazdani42/nvim-web-devicons'	" Icons in Telescope
Plug 'rmagatti/auto-session'		" Save sessions
Plug 'rmagatti/session-lens'		" Telescope session picker
Plug 'preservim/nerdtree'
Plug 'ellisonleao/glow.nvim' 		" Vim Glow -> markdown preview
Plug 'mengelbrecht/lightline-bufferline'

" cheat.sh
" Use with <Leader>KK, <Leader>KP, <Leader>KR, <Leader>KC
" Plug 'dbeniamine/cheat.sh-vim'
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

" Coc prettier bind
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
" format code
nmap <leader>cf  <Plug>(coc-format-selected)



" Typescript start ------------------------------

let g:yats_host_keyword = 1
" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" " dark red
" hi tsxTagName guifg=#E06C75
" hi tsxComponentName guifg=#E06C75
" hi tsxCloseComponentName guifg=#E06C75

" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxCloseTagName guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575

" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" " light-grey
" hi tsxTypeBraces guifg=#999999
" " dark-grey
" hi tsxTypes guifg=#666666

"------------------------------ Typescript 


" General stuff ------------------------------
" Autosave on focus loss
:au FocusLost * :wa
colorscheme onedark
"colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" Yank and paste with the system clipboard
set clipboard=unnamedplus

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
" ----------------------------- General stuff

"  Binds ----------------------------------
nnoremap <C-Tab> :bnext<cr>
nnoremap <S-C-Tab> :bNext<cr>
nnoremap <F4> :bd<CR>
nnoremap <leader>p :Glow<CR>
nnoremap <leader>ss :source ~/.config/nvim/init.vim<cr>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" Telescope: Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope session-lens search_session<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>d :CocList diagnostics<cr>
nnoremap <leader>ds :CocList -I symbols<cr>
nmap <silent> ca <cmd>Telescope coc line_code_actions<cr>
nmap <silent> cs <cmd>Telescope coc document_symbols<cr>
nmap <silent> cd <cmd>Telescope coc diagnostics<cr>
nmap <silent> cc <cmd>Telescope coc commands<cr>
" Coc:::::::::::::::::::::::
" GoTo code navigation.
nmap <silent> td <cmd>Telescope coc definitions<cr>
nmap <silent> tr <cmd>Telescope coc references<cr>
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

" Coc jump command tab if not open -> not needed with buffers
function! TabeIfNotOpen(...)
    let fname = a:1
    let call = ''
    if a:0 == 2
	let fname = a:2
	let call = a:1
    endif
    let bufnum=bufnr(expand(fname))
    let winnum=bufwinnr(bufnum)
    if winnum != -1
	" Jump to existing split
	exe winnum . "wincmd w"
    else
	" Make new split as usual
	exe "tabe " . fname
    endif
    " Execute the cursor movement command
    exe call
endfunction

command! -nargs=+ CocTabeIfNotOpen :call TabeIfNotOpen(<f-args>)

" Diff view
nnoremap <leader>do <cmd>DiffviewOpen<cr>
nnoremap <leader>dc <cmd>DiffviewClose<cr>

" jump to the next function
nnoremap <leader>j :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>
" jump to the previous function
nnoremap <leader>k :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>

" Lightline config with coc stuff
let g:lightline = {
\ 'colorscheme': 'one',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'tabline': {
\   'left': [ ['buffers'] ],
\   'right': [ ['close'] ]
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\   'buffers': 'tabsel'
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }
" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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

" Coc in telescope!
lua << EOF
require("telescope").setup({
  extensions = {
    coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})
require('telescope').load_extension('coc')
EOF
