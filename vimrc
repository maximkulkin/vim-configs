" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp/     " Keep swap files in one location

set tabstop=4                     " Global tab width.
set shiftwidth=4                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P
set modeline
set modelines=5

set splitbelow
set splitright

set list
set listchars=tab:\|_,trail:.

set textwidth=85
set colorcolumn=85

set nocindent
set smartindent

" Common annoying command mistypes
command! W :w
command! Q :q
command! Bd :bd

nmap <C-e> :b#<cr>
nmap <C-h> :nohlsearch<cr>

nmap E :e <c-r>=expand("%:h")<cr>/

set guifont=Andale\ Mono:h18
set guioptions=acg

" quick exit from insert mode
inoremap jk <esc>
" edit and source vim config quickly
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>es :source ~/.vimrc<cr>


" Plugins
call plug#begin()
" syntax scheme
Plug 'tpope/vim-vividchalk'
" Extend '.' (repeat last action) command to support non-native actions
Plug 'tpope/vim-repeat'
" Commands to surround/remove surrond text
Plug 'tpope/vim-surround'
" Highlight nested parenthesis with different colors
Plug 'luochen1990/rainbow'
" Automatically change directory to project root
Plug 'airblade/vim-rooter'

" Fuzzy search for files/buffers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linter errors highlight
Plug 'dense-analysis/ale'

" Status line
Plug 'itchyny/lightline.vim'
" Show linter errors in status line
Plug 'maximbaz/lightline-ale'

" C# language server integration
Plug 'OmniSharp/omnisharp-vim'
" C# Mappings, code-actions available flag and statusline integration
Plug 'nickspoons/vim-sharpenup'

" Run tests from inside editor
Plug 'janko-m/vim-test'

" Completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright'

" Interactive debugger
Plug 'puremourning/vimspector'

call plug#end()

" use vividchalk
colorscheme vividchalk

" comment/uncomment lines
vnoremap # :s/^\([ \t]*\)\([^ \t]\)/\1# \2/e<cr>:nohlsearch<cr>
vnoremap -# :s/^\([ \t]*\)# /\1/e<cr>

nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fb :Buffers<cr>

" Settings for vim-test
nnoremap <silent> <leader>tt :TestFile<cr>
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>tn :TestNearest<cr>

let g:rainbox_active = 1

" FZF
" let g:fzf_action = {
" \  'ctrl-t': 'vsplit'
" \}
" let g:fzf_layout = { 'window': {
" \ 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0
" \} }
let g:fzf_layout = { 'down': '30%' }

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Lightline
let g:lightline = {}
let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\}

let g:lightline.component_type = {
\  'linter_checking': 'right',
\  'linter_infos': 'right',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'linter_ok': 'right',
\}

let g:lightline.active = {
\ 'right': [
\   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\   [ 'lineinfo' ],
\   [ 'percent' ],
\   [ 'filetype']
\ ]
\}

" OmniSharp
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [0],
\ 'border': [1],
\ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
\ 'borderhighlight': ['ModeMsg']
\}
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'

autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <buffer> <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <buffer> <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>a :OmniSharpCodeActions<cr>

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>de :call vimspector#Reset()<cr>
nnoremap <leader>dc :call vimspector#Continue()<cr>

nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<cr>

nnoremap <leader>do <Plug>VimspectorStepOver
nnoremap <leader>di <Plug>VimspectorStepInto
nnoremap <leader>dO <Plug>VimspectorStepOut

nnoremap <leader>dw <Plug>VimspectorWatch
