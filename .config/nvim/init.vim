let mapleader = " "
" calling Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'
" easymotion
Plug 'easymotion/vim-easymotion'
nmap <Space> <Plug>(easymotion-bd-w)

" NERD tree
Plug 'preservim/nerdtree'

" Code Complition
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-java',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-rls',
    \ 'coc-python',
    \ 'coc-eslint',
    \ 'coc-pairs',
    \ 'coc-highlight',
    \ 'coc-clangd'
\ ]

" Suda.vim
Plug 'lambdalisue/suda.vim'
let g:suda_smart_edit = 1

" Color scheme

Plug 'rakr/vim-one'

" Status line

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}' " Show time instead of line number

call plug#end()
" NERDTree
nmap <C-f> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" for coc 
set hidden
set cmdheight=2
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" color scheme
set termguicolors
colorscheme one
let g:airline_theme='one'
set background=dark
" line numbering
set nu 
set relativenumber

" indenting 
set tabstop=5 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" multi windowd work
nnoremap <TAB> <C-w><C-w>
map <silent> <Leader>d :vs new split<CR>
set splitbelow
set splitright
nnoremap <silent> + :vertical resize +3<CR>
nnoremap <silent> _ :vertical resize -3<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Also allow this in terminals
tmap <C-H> <Esc><C-H>
tmap <C-J> <Esc><C-L>
tmap <C-K> <Esc><C-K>
tmap <C-L> <Esc><C-L>

" terminal
tmap <silent> <F1> <C-\><C-n>:q<CR>
tmap <Esc> <C-\><C-n>
nmap <C-t> :vsplit<CR><C-l>:set nonumber<CR>:set norelativenumber<CR>:terminal<CR>i
" clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" instead of C-v to get into Visual block mode use m-v
command! Vb normal! <C-v>

" search
set incsearch ignorecase smartcase hlsearch

" encoding
set encoding=utf-8
set fileencoding=utf-8

" backups
set nobackup
set nowritebackup
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

" run
nmap <silent> <Leader>r :w<CR>:call setreg('z', [expand('%:p')])<CR>:vsplit<CR>:vertical resize 40<CR>:set nonumber<CR>:set norelativenumber<CR>:terminal<CR>irun <ESC> "zpA<CR> <ESC> 
" hebrew

for b in [ "א", "ב", "ג", "ד", "ה", "ו" ,"ז", "ח", "ט", "י", "כ", "ל", "מ", "נ", "ס", "ע", "פ" ,"ק", "ר", "ש", "ת"]
    exec ":nmap <silent> " . b . " :echo \"you are using hebrew\"<CR>"
endfor

" Use jk,kj to Escape from insert mode
imap jk <Esc>
imap kj <Esc>
vmap jk <Esc>
vmap kj <Esc>

" etc
set noshowmode
set formatoptions-=cro
" set mouse=a
set updatetime=300
set timeoutlen=100
nmap <silent> <Leader>w :w<CR>
nmap <silent> <Leader>q :q<CR>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-a> <C-o>A
