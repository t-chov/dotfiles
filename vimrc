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

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

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
colorscheme atom
filetype plugin indent on
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
set hlsearch
set backspace=indent,eol,start
highlight cusorline term=reverse cterm=reverse
set laststatus=2 " always shows status
set rtp+=/usr/local/opt/fzf " for fzf

" disable auto comment out
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro

" indent size
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END

autocmd BufNewFile,BufRead *.scala setf scala
autocmd BufNewFile,BufRead *.pug,*.jade setf pug
autocmd BufNewFile,BufRead *.vue setf vue
autocmd BufNewFile,BufRead *.twig setf twig

" listing
set list
set listchars=tab:¦-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%

" tab operation
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap sf gt
nnoremap sb gT

" wrapping
nnoremap sw :<C-u>set wrap<CR>
nnoremap sW :<C-u>set nowrap<CR>

" split windows
set splitright
set splitbelow
nnoremap sv :<C-u>vs<CR>
nnoremap ss :<C-u>sp<CR>

" omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" =================

" =================
" neocomplete.vim
let g:acp_enableAtStartup = 0
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
" 辞書の設定
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" =================

" =================
" unite.vim
nnoremap su  :<C-u>Unite<CR>
nnoremap suf :<C-u>Unite file<CR>
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

" =================
" vimshell
nnoremap vs :<C-u>VimShell<CR>
nnoremap vp :<C-u>VimShellPop<CR>
" =================

" =================
" neosnippet
" C-kでスニペットを展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" 自分のスニペットを ~/.vim/snip/ に追加
let s:my_snip = '~/.vim/snip/'
let g:neosnippet#snippets_directory = s:my_snip
" =================

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" neoformat
autocmd BufWritePre *.js Neoformat

" ALEの入力中シンタックスチェックをやめる
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
