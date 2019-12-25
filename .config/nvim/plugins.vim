" dein settings {{{
" dein init {{{
let s:plugins_path = expand('~/.config/nvim/')
let s:dein_path    = s:plugins_path . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_path
" }}}

if dein#load_state(s:dein_path)
    call dein#begin(s:plugins_path)
    call dein#add('Shougo/dein.vim')
    call dein#add('neoclide/coc.nvim', {'rev': 'release'})
    call dein#add('Shougo/vimproc.vim',{'build' : 'make'})
    call dein#add('thinca/vim-quickrun')
    call dein#add('vim-scripts/gtags.vim')
    call dein#add('neovimhaskell/haskell-vim')
    call dein#add('ujihisa/neco-ghc')
    call dein#add('tpope/vim-endwise')
    call dein#add('tpope/vim-rails')
    call dein#add('derekwyatt/vim-scala')
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('slim-template/vim-slim')
    call dein#add('neomake/neomake') " syntax checker
    call dein#add('benjie/neomake-local-eslint.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('cormacrelf/vim-colors-github')
    call dein#add('posva/vim-vue')
    call dein#add('thinca/vim-ref')
    call dein#add('kassio/neoterm')
    call dein#add('Jagua/vim-denite-ghq')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) " If install using Homebrew
    call dein#add('junegunn/fzf.vim')
    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on
" }}}

"gtags.vim {{{
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" }}}

" colorscheme {{{
colorscheme github
" }}}

"{{{ neoterm
let g:neoterm_default_mod=':botright'
let g:neoterm_autoscroll=1
let g:neoterm_autoinsert=1
nnoremap <c-t><c-t> :Ttoggle<CR>
tnoremap <c-t><c-t> <C-\><C-n>:Ttoggle<CR>
tnoremap <ESC> <C-\><C-n>
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
"}}}

"{{{ fzf
nnoremap <silent> ,ub :<C-u>Buffers<CR>
nnoremap <silent> ,uf :<C-u>GFiles<CR>
nnoremap <silent> ,ug :<C-u>Rg<Space>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~30%' }
"}}}

"{{{ coc
let g:coc_global_extensions = ['coc-solargraph']
"}}}
