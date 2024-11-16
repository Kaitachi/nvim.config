" Source your .vimrc
"source ~/.config/nvim/vim/.vimrc
:set number relativenumber " Show Line Numbers
:set incsearch hlsearch " Search Highlighting
:set ignorecase smartcase " Search smartly
":set encoding=utf-8

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color GNU screen.
  set t_ut=
endif
