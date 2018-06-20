set title                       "allow vim to alter the title bar of the terminal
set titlestring=%<%F\ %M%R\ %n  "the format of the terminal title
set backspace=2                 " Backspace deletes like most programs in insert mode
set history=50
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set hlsearch                    " highlight search results
set laststatus=2                " Always display the status line
set autowrite                   " Automatically :write before running commands
set nowrap                      " turn off word wrap
set cmdheight=2                 " make command area two lines high
set statusline=\ %n\ \ %<%F%=\ %c\ \ %l/%L\ \ \ %r
set showtabline=2               " 0=never; 1=when applicable; 2=always
set showmode                    " show the current mode
set visualbell t_vb=            " Turn off audible bell
set clipboard=unnamed           " hopefully catch the cut/paste of the OS
set diffopt=filler,iwhite       " Ignore whitespace in diff
set showmatch                   " show the matching bracket
"set autoindent                  " auto indent based on previous line
set autochdir                   " automatically change the working dir to the dir of the current file/buffer/window
set cursorline                  " show the current cursor line
set matchpairs+=<:>             " add html tag delimeters to bracket matching
set whichwrap=<,>,[,],h,l       " Allows for left/right keys to wrap across lines

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Remove trailing white space on :w
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
"set smartindent " indent after curly braces

" Display extra whitespace
set list listchars=tab:»·,extends:»,precedes:«,trail:~,nbsp:¬,space:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

colorscheme molokai
