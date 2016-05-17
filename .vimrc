" =================
" Set up dein.vim
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/plugins')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#end()
  call dein#save_state()
endif

" install plugins that not yet installed
if dein#check_install()
  call dein#install()
endif
" =================

" =================
" Common Vim settings
syntax on
set nobackup
set noundofile " for kaoriya vim
set encoding=utf-8
set visualbell t_vb= " do not sound
set number
set ruler
set nowrap
set showmatch
set noswapfile
set cursorline
highlight cusorline term=reverse cterm=reverse
set laststatus=2 " always shows status

" indent size
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" listing
set list
set listchars=tab:¦-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%

" tab operation
nnoremap st: <C-u>tabnew<CR>
nnoremap sT: <C-u>Unite tab<CR>
nnoremap sf gt
nnoremap sb gT

" wrapping
nnoremap sw: <C-u>set wrap<CR>
nnoremap sW: <C-u>set nowrap<CR>
" =================

" =================
" neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#max_list = 10
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_close_preview = 0
"AutoCmd InsertLeave * silent! pclose!
let g:neocomplete#max_keyword_width = 10000
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'
" =================

" =================
" unite.vim
nnoremap su: <C-u>Unite<CR>
nnoremap suf : <C-u>Unite file<CR>
" insert mode on
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" file open is tab
call unite#custom#default_action('file', 'tabopen')
" =================

" =================
" nerdtree
let NERDTreeShowHidden = 1
nnoremap nt : <C-u>NERDTree<CR>
" =================

" =================
" nerdcommenter
let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
      \ 'jsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
    \ }
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" =================
" git-fugitive
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>
" =================
