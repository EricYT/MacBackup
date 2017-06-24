" normal settings
set nocompatible      " Disable vi compatibility
set encoding=utf8     " file encoding
set nu                " Display the line number
set timeoutlen=250    " Time to wait after ESC
set hlsearch          " Hightight search
set smartcase         " Be sensitive when there's a capital letter
set ai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set spell
set nofoldenable

" theme
syntax on
"set background=dark
set background=light
"let g:solarized_termtrans=1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_termcolors=256
colorscheme solarized
"colorscheme ir_black
"colorscheme fruity
"colorscheme molokai
"colorscheme peaksea

set cursorline
hi CursorLine   cterm=NONE ctermbg=blue ctermfg=white guibg=darkred guifg=white

" maping keys
inoremap jk <ESC>

" modify leader key
let mapleader = ','

" UndotreeToggle
nnoremap <F5> :UndotreeToggle<cr>

" Vundle
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" 可以通过以下四种方式指定插件的来源
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/SuperTab'

" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'oscarh/vimerl'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'fatih/vim-go'
Bundle 'klen/python-mode'
Bundle 'elixir-lang/vim-elixir'
Bundle 'jiangmiao/auto-pairs'
"Bundle 'scrooloose/syntastic'
" Unite
"   depend on vimproc
"   ------------- VERY IMPORTANT ------------
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
"   -----------------------------------------"
Bundle 'shougo/neocomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'begriffs/haskell-vim-now'
Bundle 'majutsushi/tagbar'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'dag/vim2hs'
" snipmate dependencies'
Bundle 'honza/vim-snippets'
Bundle 'guns/vim-clojure-static'
Bundle 'mbbill/undotree'
" colors
Bundle 'spf13/vim-colors'
" Rust
Bundle 'wting/rust.vim'
" fix writespace
Bundle 'bronson/vim-trailing-whitespace'
" markdown
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
" tabman
Bundle 'kien/tabman.vim'
Bundle 'rking/ag.vim'
" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
" for javascript
Bundle 'pangloss/vim-javascript'
" for elm
Bundle 'ElmCast/elm-vim'
" Most Recently Used
Bundle 'vim-scripts/mru.vim'


" c) 指定非Github的Git仓库的插件，需要使用git地址
"Bundle 'git://git.wincent.com/command-t.git'

" d) 指定本地Git仓库中的插件
"Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required!

" powerline settings
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/.ycm_extra_conf'

" Tagbar configuration
nmap <F8> :TagbarToggle<CR>
let tagbar_left=1
let g:tagbar_compact=1

" NERDTree configuration
nmap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" turn off go doc window
set completeopt=menu

" haskell
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1
"let g:necoghc_debug = 1

" enable omnifunc
set omnifunc=syntaxcomplete#Complete

" vim complete
:set runtimepath^=~/.vim/bundle/vim-erlang-omnicomplete

" For ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

if has("persistent_undo")
  set undodir=~/.undodir/
    set undofile
  endif

" tell it to use a undo file
set undofile
" set a directory to store undo history
set undodir=~/.vimundo/

" unit
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" TabMan ------------------------------
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" golint
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" for elm
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

" MRU configuration
nmap <F3> :MRU<CR>
let MRU_Max_Entries = 20
