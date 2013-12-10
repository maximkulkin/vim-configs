" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

" Init bundle stuff
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

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

" Or use vividchalk
colorscheme vividchalk

" Make file saving with 'W' as a mistype it so often
command! W :w

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

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

let g:ftplugin_sql_omni_key = '<C-q>'
let g:sql_type_default = 'mysql'

set guifont=Andale\ Mono:h18
set guioptions=acg

let g:bufExplorerShowRelativePath=1

" quick exit from insert mode
inoremap jk <esc>
" edit and source vim config quickly
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>es :source ~/.vimrc<cr>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

runtime python_location.vim

let g:pymode_folding=0

