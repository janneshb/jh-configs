
if !exists('g:vscode')
  " Can move plugin stuff here if there are vscode incompatibilities
endif

" vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

" package manager
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" allignment
Plugin 'junegunn/vim-easy-align'

" surround
Plugin 'tpope/vim-surround'

" Allow surround commands to be repeated
Plugin 'tpope/vim-repeat'

call vundle#end()

" Note, loadview must be run first so as to not overwrite other settings in
" this config
" For troubleshooting what settings are getting overwritten, use `verb` e.g.:
" verb set fo

" Remember cursor position in every previously-opened file
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent! loadview

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Whitespace
set nowrap                      " don't wrap lines
set linebreak                   " break at words
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
"set hlsearch                    " highlight matches
"set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" show line numbers
set number

" whitespace highlighting
:highlight ExtraWhitespace ctermbg=red
:match ExtraWhitespace /\s\+$/

" trim command to remove trailing whitespace
command! Trim :%s/\s\+$//e

" Allow ctrl-a to increment letters too (previously only numbers)
set nrformats+=alpha

" Create newlines
" Jump cluttering variant
nmap oo m`o<Esc>``
nmap OO m`O<Esc>``

" Disable expand tab for makefiles
" Could also manually use :set noet and :set et
autocmd FileType make setlocal noexpandtab

" Disable auto commenting
" Todo - needs more troubleshooting
" https://vi.stackexchange.com/questions/9366/set-formatoptions-in-vimrc-is-being-ignored
" For now, just :set fo-=o

" autocmd FileType * setlocal formatoptions-=r formatoptions-=o
autocmd FileType * setlocal formatoptions-=o
" autocmd BufNewFile,BufRead * setlocal formatoptions-=r formatoptions-=o
" set formatoptions-=r formatoptions-=o

" Disable auto commenting only line comments
" But keep for block comments
" au FileType c,cpp,cc,h setlocal comments-=:// comments+=f://

" usefull for oo commands
" although only really needed if not typing o on next line
set timeoutlen=200

