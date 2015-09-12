" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible
filetype  off

if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet' 
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache-rsense', {
            \ 'autoload' : {
            \     'filetypes' : ['ruby']
            \ }}
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw64.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \ }}
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle "vim-scripts/gtags.vim"
"NeoBundle 'vim-scripts/TwitVim'
"NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'dag/vim2hs'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'tpope/vim-endwise'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-rails'
NeoBundle 'sophacles/vim-processing'
"NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kannokanno/previm'
NeoBundle 'open-browser.vim'
NeoBundle 'derekwyatt/vim-scala'

" coffee-scirptsyntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" カラースキーム
"
NeoBundle 'altercation/vim-colors-solarized'
call neobundle#end()


"プラグイン系 設定
""" unite.vim
" 入力モードで開始する
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" unite-grep keymap
vnoremap ,g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" neocomplete
let g:neocomplete#enable_at_startup = 1 " 起動時に有効化
let g:neocomplete#enable_underbar_completion = 1 " _の補完を有効化

" neosnippet 
" スニペット呼び出し
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
"プレビュー
set completeopt-=preview

" vimshell setting
let g:vimshell_interactive_update_time = 10

" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

" twitvim
"let twitvim_count = 40
"nnoremap ,tp :<C-u>PosttoTwitter<CR>
"nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
"nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
"nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
"nnoremap ,tn :<C-u>NextTwitter<CR>
"
"autocmd FileType twitvim call s:twitvim_my_settings()
"function! s:twitvim_my_settings()
"    set nowrap
"endfunction

" 辞書の設定
" ref.vim の webdict の設定
" FileTypeがtextならKでwebdictを使う
autocmd FileType text call ref#register_detection('_', 'webdict') 
" yahoo_dict と wikipedia を使う
let g:ref_source_webdict_sites = {
            \ 'yahoo_dict' : {'url' : 'http://dic.search.yahoo.co.jp/search?p=%s', 'line' : '47'},
            \ 'wikipedia'  : {'url' : 'http://ja.wikipedia.org/wiki/%s',},}
" webdict の辞書のデフォルトはyahoo_dict
let g:ref_source_webdict_sites.default = 'yahoo_dict'
" テキストブラウザはw3mを使う
let g:ref_source_webdict_cmd = 'w3m -dump %s'

"endwise.vim
"let g:endwise_no_mappings=1
"
"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"lightline
"colorschemeをsolarized
let g:lightline = {
            \ 'colorscheme' : 'solarized' ,
            \}

"quickrunでprocessingを実行
let g:quickrun_config = {}
let g:quickrun_config.processing =  {
            \     'command': 'processing-java',
            \     'exec': '%c --sketch=$PWD/ --output=~/Library/Processing --run --force'
            \   }
"gtags.vim
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

""vim-indent-guides
"let g:indent_guides_enable_on_vim_startup=1
"" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=1
"" 自動カラーを無効にする
"let g:indent_guides_auto_colors=0
"" 奇数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=1
"" 偶数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=4
"" ガイドの幅
"let g:indent_guides_guide_size = 1
"" ガイド幅をインデント幅に合わせる
""let g:indent_guides_guide_size = &tabstop


filetype plugin on
filetype indent on

"色付け
syntax on

" 背景色を dark にする
"set background=dark

" 輝度を高くする
"let g:solarized_visibility = "high"
"
" コントラストを高くする
"let g:solarized_contrast = "high"

" カラースキーマを Solarized にする
colorscheme solarized

" エンコーディングをutf-8
set encoding=utf-8
" 読み込みエンコーディング
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" ファイルの前回閉じた時の場所を記憶
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

"^oでオムニ補完
"imap <C-o> <C-x><C-o>

"パーシスタントundo
if has('persistent_undo')
    set undodir=~/.vim/.vimundo
    set undofile
endif

" 折りたたみ設定
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
set viewoptions-=options

"テンプレ設定
autocmd BufNewFile *.tex 0r ~/.vim/templates/tex.tex "texのテンプレ
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.sh "shのテンプレ
autocmd BufNewFile *.py 0r ~/.vim/templates/python.py "pythonのテンプレ

"texのファイル構成
autocmd BufNewFile report.tex !cp ~/.vim/templates/Makefile ~/.vim/templates/jlisting.sty ./

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
"set hlsearch

"インクリメンタルな検索を行う
set incsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
"set ignorecase
"set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" auto current directory
set autochdir

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=1

" 行番号を表示
"set number

" 相対番号を表示
" set relativenumber

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
"set pastetoggle=<F11>

" オートインデント
set autoindent

" インデント時の空白数
set shiftwidth=4

" tabキーの空白の数
set softtabstop=4

" tabキーの代わりに半角スペースを使う
set expandtab

" タブ文字を文字分の幅で表示する。
set tabstop=4

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

".rhtml, .rb, .erb, .haml .html .js .jade .feature .php .hsでタブ幅を2に変更
au BufNewFile,BufRead *.rhtml set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.haml set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.scss set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.js set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.jade set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.scala set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.feature set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.php set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.hs set nowrap tabstop=2 shiftwidth=2 softtabstop=2


" マッピング
" Yの動作をDやCと同じにする
map Y y$

" <C-L>で検索後の強調表示を解除す
nnoremap <C-L> :nohl<CR><C-L>

"ファイルタイプ設定をonにする
filetype on
