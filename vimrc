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
" Expand tabs
set expandtab
" Clipboard X11
set clipboard+=unnamedplus

colorscheme hybrid_material
if has('unix')
        set t_Co=256
endif

" Cool trick to save when you forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Enable auto-complete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog="/home/raito/.virtualenvs/neovim/bin/python3"
let g:python_host_prog="/home/raito/.virtualenvs/neovim2/bin/python2"

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

" Prevent Vim slowness with very long lines
set synmaxcol=300

" Pandoc config
let g:pandoc#spell#default_langs = ['fr', 'en', 'es']
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#autoexec_command = 'Pandoc! pdf'
let g:pandoc#syntax#conceal#use = 0

let maplocalleader = ','

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
autocmd FileType python let g:pymode_lint_ignore = "E501"
