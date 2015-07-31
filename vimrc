" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

" Init bundle stuff
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags                          " Fix help

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

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
set directory=.,$HOME/.vim/tmp/   " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P
set modeline
set modelines=5

set splitbelow

set list
set listchars=tab:\|_,trail:.

" Or use vividchalk
colorscheme vividchalk

" Common annoying command mistypes
command! W :w
command! Q :q
command! Bd :bd

nmap <C-e> :b#<cr>
nmap <C-h> :nohlsearch<cr>

nnoremap    [unite]   <Nop>
nmap    <leader>f [unite]

nnoremap <silent> [unite]f  :<C-u>Unite
        \ -buffer-name=files -start-insert file_rec<CR>
nnoremap <silent> [unite]b  :<C-u>Unite
        \ -buffer-name=buffers -prompt=%\  buffer bookmark<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
        \ -buffer-name=registers register<CR>

" let g:unite_enable_start_insert = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

call unite#custom#source('file_rec', 'ignore_pattern',
  \'\%(^\|/\)\.$'.
  \'\|\~$'.
  \'\|\.\%(o\|DS_Store\|zwc\|pyc\|sw[po]\|class\)$'.
  \'\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)'.
  \'\|dist')

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

let g:ftplugin_sql_omni_key = '<C-q>'
let g:sql_type_default = 'mysql'

set guifont=Andale\ Mono:h18
set guioptions=acg

" quick exit from insert mode
inoremap jk <esc>
" edit and source vim config quickly
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>es :source ~/.vimrc<cr>
nnoremap <leader>t :ConqueTermSplit bash<cr>

vnoremap # :s/^\([ \t]*\)\([^ \t]\)/\1# \2/e<cr>:nohlsearch<cr>
vnoremap -# :s/^\([ \t]*\)# /\1/e<cr>

runtime python_location.vim

let g:pymode_motion = 1

let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_message = 1
let g:pymode_lint_ignore = 'E501,W'
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_folding = 0
let g:pymode_lint_mccabe_complexity = 16

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'

let g:pymode_syntax_all = 1


augroup HaskellHeredocHighlight
  au FileType haskell syn region HaskellHeredoc start="\[i|" end="|]" contains=HaskellHeredocExpr
  au FileType haskell syn region HaskellHeredocExpr start="${" end="}" keepend contained contains=TOP
  au FileType haskell hi link HaskellHeredoc   String
augroup END

" Show trailing whitepace
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

" Airline settings
let g:airline_powerline_fonts = 1

let g:gist_show_privates = 1
let g:gist_post_private = 1
