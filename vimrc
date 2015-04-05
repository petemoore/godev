"Enable Vundle for plugin management.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/molokai'
Plugin 'Valloric/YouCompleteMe'
" IMPORTANT NOTE: nsf/gocode is what does the autocompletion.
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on
"Ok. Done.

"let g:molokai_original=1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:go_fmt_command = "goimports"
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set number
set ruler
syntax on
set backspace=indent,eol,start

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Open file at a position where it was last left.
au BufWinLeave *.go mkview
au BufWinEnter *.go silent loadview

" Up and down for ycm
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" Use tab for snippets
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Change mapleader 
let mapleader = ","
au FileType go nmap <leader>b <Plug>(go-build)

" vim-go syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" use tagbar for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
                \ }

nmap <F8> :TagbarToggle<CR>

colorscheme molokai

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

