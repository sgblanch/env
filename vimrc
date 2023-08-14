runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set nobackup

"" Configure colors and themes
set t_Co=256                             " terminal supports 256 colors
colorscheme codedark                     " syntax theme
let g:airline_theme =  'molokai'         " status bar theme
let g:tmuxline_powerline_separators = 0  " requires modified font

"" Inline spell checking
if has("spell")
	set spelllang=en_us
	set spellfile=~/.vim/spell/en.utf-8.add
	set spellsuggest=5
	" Enable spell checking in text and markdown files
	autocmd FileType text,markdown set spell
endif

set printoptions=number:y,left:5pc,paper:letter

"" Case sensitivity when seaching
set smartcase   " ignore case if term is all lowercase
"set ignorecase " ignore case when searching

"" Highlight and jump to matching {[()]}
set showmatch

"" Allow modelines at the end of files
"set modeline
"set modelines=5

"" Configure tabs.  It is better to let languages hand this on their own
"set expandtab     " expand tabs to spaces
"set tabstop=2     " tab == 2 spaces
"set shiftwidth=2  " indent == 2 spaces

"" Enable mouse support if compiled with +clipboard and we are not
"" connected via SSH.
if has("clipboard") && ($SSH_CONNECTION == "")
	set mouse=a
	"" use system clipboard (e.g macOS pasteboard or X11 clipboard)
	set clipboard=unnamed
endif

"" Disable .viminfo file
set viminfo=

"" Line numbering (except text files)
set number
autocmd FileType text set nonumber

"" Highlight column 73
set colorcolumn=73

"" Always show vim-gitgutter's column.  Otherwise it can be slow to add
"" itself, causing the display to jump right and can even prevent access
"" to first two characters on a line until it loads
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

"" Wrap pure text files to 72-characters
autocmd FileType text setlocal textwidth=72

"" Configure markdown support including R markdown
autocmd BufNewFile,BufReadPost *.Rmd set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'r']
let g:vim_markdown_folding_disabled = 1

"" Assume /bin/sh is POSIX compatible
let g:is_posix = 1

"" Use goimports instead of gofmt
let g:go_fmt_command = "goimports"
