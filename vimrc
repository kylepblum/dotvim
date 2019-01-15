"This is to get vim to recognize my shell 
set shell=/bin/zsh

"Initialize vim
set nocompatible
filetype plugin on
syntax on

"Keystroke stuff
set backspace=indent,eol,start

"Indenting options
filetype plugin indent on
set tabstop=2
set expandtab

set number

"This turns comments into italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set nowrap "take off line wrapping

call plug#begin('~/.vim/bundle/')
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

syntax enable

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ }
"Wiki stuff
let wiki_kpb = {}
let wiki_kpb.path = '$HOME/Wiki'
let wiki_kpb.syntax = 'markdown'
let wiki_kpb.ext = '.md'
let wiki_kpb.autotags = 1
let wiki_kpb.nested_syntaxes = {'python': 'python'}
let g:vimwiki_list = [wiki_kpb]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_global_ext = 0
let g:vimwiki_conceallevel = 2
let g:vimwiki_hl_headers = 1 "highlight headers
let g:vimwiki_hl_cb_checked = 1 "highlight checked items

"VimWiki Templates {{{
if has("autocmd")
    augroup templates
        autocmd BufNewFile *Notes.md 0r ~/.vim/templates/ProjectTemplate.md
        autocmd BufNewFile */diary/????-??-??.md 0r ~/.vim/templates/diaryTemplate.md
    augroup end
endif
" }}}


" Link handling
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'edit ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction



"gx command will get full URL for mail messages. 
let g:netrw_gx="<cWORD>"



setlocal conceallevel=2


let mapleader=","

