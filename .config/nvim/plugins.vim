" dein settings {{{
" dein init {{{
let s:plugins_path = expand('~/.config/nvim/')
let s:dein_path    = s:plugins_path . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_path
" }}}

if dein#load_state(s:dein_path)
    call dein#begin(s:plugins_path)
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet' )
    call dein#add('Shougo/neosnippet-snippets')
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
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('posva/vim-vue')
    call dein#add('thinca/vim-ref')
    call dein#add('autozimu/LanguageClient-neovim', { 'build': './install.sh'})
    call dein#add('tbodt/deoplete-tabnine', { 'rev': 'next', 'build': 'bash install.sh'})
    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on
" }}}

" denite.vim {{{
nnoremap <silent> ,ub :<C-u>Denite buffer<CR>
nnoremap <silent> ,uf :<C-u>Denite file_rec<CR>
nnoremap <silent> ,ur :<C-u>Denite register<CR>
nnoremap <silent> ,ug  :<C-u>Denite grep:.<CR>
" }}}

" deoplete & neosnippet {{{
let g:deoplete#enable_at_startup = 1
" neosnippet mapping
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" }}}

"gtags.vim {{{
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" }}}

" neomake {{{
let g:neomake_ruby_enabled_makers=['rubocop']
let g:neomake_scss_enabled_makers=['scsslint']
let g:neomake_javascript_enabled_makers=['eslint']
augroup SyntaxCheck
    autocmd!
    autocmd BufWritePost * Neomake
augroup END
" }}}

" colorscheme {{{
colorscheme solarized
" }}}
