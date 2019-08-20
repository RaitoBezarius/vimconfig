if &shell =~# 'fish$'
    set shell=bash
endif

call plug#begin('~/.vim/plugged')

Plug 'leafgarland/typescript-vim'
" Plug 'let-def/ocp-indent-vim'
" Plug 'ocaml/merlin'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'Konfekt/FastFold'
Plug 'Shougo/context_filetype.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dag/vim-fish'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'racer-rust/vim-racer'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
" Plug 'mxw/vim-jsx', { 'for': 'javascript '}
Plug 'kien/ctrlp.vim'
" Plug 'goatslacker/mango.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'Shougo/neoinclude.vim'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'pearofducks/ansible-vim'
" Plug 'elixir-lang/vim-elixir'
" Plug 'wting/rust.vim', { 'for': 'rust '}
" Plug 'tpope/vim-dispatch'
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'neomake/neomake'
if !has('nvim')
        Plug 'tpope/vim-sensible'
end
" Plug 'gkz/vim-ls', { 'for': 'livescript' }
" Plug 'klen/python-mode'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'Shougo/context_filetype.vim'
Plug 'SirVer/ultisnips'
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'mitsuhiko/vim-jinja', { 'for': 'jinja2' }
" Plug 'itchyny/landscape.vim'
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
" Plug 'flazz/vim-colorschemes'
Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'RaitoBezarius/vim-snippets'
" Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'digitaltoad/vim-pug'
" Plug 'nanotech/jellybeans.vim'
" Plug '~/.vim/bundle/tmux-config'
" Plug 'morhetz/gruvbox'
Plug 'Shougo/echodoc'
" Plug 'dylanaraps/wal'
Plug 'romainl/flattened'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set nocompatible
" Syntax highlighting
syntax on
filetype plugin indent on
" Nullify timeout
set ttimeoutlen=-1
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
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
        \ 'ocaml': ['/home/raito/.nvm/versions/node/v7.10.1/bin/ocaml-language-server', '--stdio']
        \}
let g:LanguageClient_loggingLevel = 'DEBUG'


nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

set t_Co=256
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set termguicolors
set background=dark

" Cool trick to save when you forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Run Neomake on every write
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['python', 'pylint', 'mypy']
let g:neomake_pandoc_enabled_makers = []

" Dismiss the preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Python-specific
let g:python3_host_prog="/usr/bin/python"
let g:python_host_prog="/usr/bin/python"
let g:python2_host_prog="/home/raito/.virtualenvs/neovim2/bin/python2"
" Python specific
augroup Python
        autocmd FileType python let g:pymode_lint_ignore = "E501"
        autocmd FileType python let g:python_highlight_all = 1
        autocmd FileType python let g:pymode_rope = 0
        " Python auto-completion through Jedi
        autocmd FileType python let deoplete#sources#jedi#show_docstring = 0
        autocmd FileType python let g:pymode_lint = 0
augroup end


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
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore ".git" -g ""'

" Prevent Vim slowness with very long lines
set synmaxcol=600

" Pandoc config
let g:pandoc#spell#default_langs = ['fr', 'en', 'es']
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#autoexec_command = 'Pandoc! pdf'
let g:pandoc#syntax#conceal#use = 0

let g:pandoc#command#custom_open = "MyPandocOpen"

function! MyPandocOpen(file)
        let file = shellescape(fnamemodify(a:file, ':p'))
        let file_extension = fnamemodify(a:file, ':e')
        if file_extension is? 'pdf'
                if !empty($PDFVIEWER)
                        return expand('$PDFVIEWER') . ' ' . file
                elseif executable('evince')
                        return 'evince ' . file
                elseif executable('mupdf')
                        return 'mupdf ' . file
                endif
        elseif file_extension is? 'html' 
                if !empty($BROWSER)
                        return expand('$BROWSER') . ' ' . file
                elseif executable('firefox')
                        return 'firefox ' . file
                elseif executable('chromium')
                        return 'chromium ' . file
                endif
        elseif file_extension is? 'odt' && executable('okular')
                return 'okular ' . file
        elseif file_extension is? 'epub' && executable('okular')
                return 'okular ' . file
        else
                return 'xdg-open ' . file
        endif
endfunction

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
augroup LaTeX
        autocmd FileType tex let b:vimtex_main = 'main.tex'
        autocmd FileType tex let g:vimtex_enabled = 1
        autocmd FileType tex let g:vimtex_imaps_leader = ','
        autocmd FileType tex let g:vimtex_view_method = 'evince'
        autocmd FileType tex nmap <silent> ,v :VimtexView<CR>
augroup end

" Powerline related
" let g:airline_theme='luna'
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

" Ensure that EditorConfig works well with Fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" FUCKING YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ansible setlocal ts=2 sts=2 sw=2 expandtab

" ************* For Fish *************

" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79

" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr

" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
let g:deoplete#complete_method = "complete"
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around']
let g:deoplete#auto_complete_delay = 30
