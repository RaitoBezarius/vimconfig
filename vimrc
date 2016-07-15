" Pathogen modules
filetype off
execute pathogen#infect()
execute pathogen#helptags()
" Syntax highlighting
syntax on
filetype plugin indent on
" Line numbers
set number
" Highlight search results
set hlsearch
" Match search result as I am typing
set incsearch
" Match case-sensitive or not based on the content.
set smartcase
" Ignore swap files, Python pre-compiled and gcc's object files.
set wildignore=*.swp,*.pyc,*.o
" Display airline bar
set laststatus=2
" Change terminal title
set title
" Lazy redrawing when executing macros
set lazyredraw
" Visual autocomplete
set wildmenu
" Highlight matching
set showmatch
" Enable folding
set foldenable
" Open all default fold at level <= 10
set foldlevelstart=10
" Nested folding level max = 10
set foldnestmax=10
" Folding by indentation
set foldmethod=indent
" Prevent Webpack from missing the write event
set backupcopy=yes
" Paste shortcut
set pastetoggle=<F2>
" Hidden mode for buffers to avoid saving the current buffer every time I do a
" goto-definition
set hidden
" Expand tabs
set expandtab
colorscheme hybrid_material
if has('unix')
        set t_Co=256
endif

" Cool trick to save when you forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Expansion triggers for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Jinja 2 autodetection
let g:htmljinja_disable_detection = 1

" Used libraries
let g:used_javascript_libs = 'underscore,react,flux'

" JSX
let g:jsx_ext_required = 0

" Let's ignore stupid things
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" Now, .agignore is the ignorer file.
" Let's make CtrlP awesome
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Vim for JSDoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1

" Prevent Vim slowness with very long lines
set synmaxcol=300

" Pandoc config
let g:pandoc#spell#default_langs = ['fr', 'en', 'es']

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif


" Clear search highlighting
nmap <silent> ,/ :nohlsearch<CR>
" Open / close folds
nnoremap <space> za
" highlight last inserted text
nnoremap gV `[v`]
" Escape duplicate because Esc is too far from me
inoremap jk <esc>


" LaTeX specific
autocmd FileType tex let b:vimtex_main = 'main.tex'
autocmd FileType tex let g:vimtex_enabled = 1
autocmd FileType tex let g:vimtex_imaps_leader = ','
autocmd FileType tex let g:vimtex_view_method = 'mupdf'
autocmd FileType tex nmap <silent> ,v :VimtexView<CR>

" Python specific
autocmd FileType python let python_highlight_all = 1

" Auto linting everywhere
autocmd! BufWritePost,BufEnter * Neomake

" Fast folding
let g:tex_fold_enabled = 1
let g:markdown_fold_enabled = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Rust completion
let g:racer_cmd = "/usr/sbin/racer"
let $RUST_SRC_PATH = "/home/raito/dev/rust/src"

" JavaScript completion
let g:tern_request_timeout = 3
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
let g:tern_show_argument_hints = 'on_hold'

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>cr_function()<CR>
function! s:cr_function() abort
        return deoplete#close_popup() . "\<CR>"
endfunction

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
