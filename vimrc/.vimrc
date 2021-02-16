set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
"set hlsearch "검색어 하이라이팅
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set autoindent "자동 들여쓰기
set scrolloff=8
set wildmode=longest,list
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=1000
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smarttab
set smartindent
set cindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\%{FugitiveStatusline()}\%h%m%r\ %F
" 구문 강조 사용
if has("syntax")
	syntax on
endif

let mapleader = ","




call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'sirver/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'
Plug 'thinca/vim-quickrun'

call plug#end()

colorscheme gruvbox
set bg=dark
highlight Normal ctermbg=black ctermfg=white

inoremap <expr> <Tab> search('\%#[]>)}]', 'n') ? '<Right>' : '<Tab>'    

"nerdcommenter"

let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment


"nerdtree"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>j

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

"syntastic"
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ultisnips"
"let g:UltiSnipsExpandTrigger="<space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"YCM"
"let g:ycm_key_list_select_completion = ['<Down>']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_show_diagnostics_ui = 0
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
