call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader = ","
set t_Co=256

set nocompatible
syntax on
filetype plugin indent on
set history=50
set wildmode=list:longest,full
set shortmess+=r
set showmode
set mouse=a
set nowrap
set shiftround
set expandtab
set smarttab
set ts=2
set bs=2                    " backspace over everything
set sw=2
set autoindent
set formatoptions-=t
set nobackup
set nowritebackup

" disable this autocomment bullshit
au FileType * setl fo-=cro

" pair matching for html/xml
set matchpairs+=<:>
set backspace=eol,start,indent

" line numbers
set relativenumber
set nu

map <leader>n :NERDTreeToggle<cr>

" language-specific completions
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,perl,tex set shiftwidth=2

" Filetype detection
augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
  au BufNewFile,BufRead *.liquid setf liquid
  au! BufRead,BufNewFile *.haml setfiletype haml
  autocmd BufNewFile,BufRead *.yml setf eruby
  autocmd BufNewFile,BufRead Guardfile setf ruby
augroup END

" Ruby stuff
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 0

" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim

set path=$PWD/public/**,$PWD/**

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Options used for mksession
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Fancy statusline
"set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P
" Syntastic stuff for status line
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_enable_signs = 1

" Show errors
map <leader>e :Errors<CR>

" Last window should always have a status line
set laststatus=2

"make Y consistent with C and D (yank to EOL)
nnoremap Y y$

" Cursor crosshair because I'm a cool guy
" SAD! these turn out to be very slow
"set cursorline
"set cursorcolumn

"folding settings
set foldmethod=indent       " this results in a decent performance increase
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " dont fold by default

set wildmode=list:longest   " make cmdline tab completion similar to bash
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.swp,*.swo " stuff to ignore when tab completing

"vertical/horizontal scroll off settings for readability
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set clipboard+=unnamed      " Yanks go on clipboard instead.
set ruler                   " Ruler on
set timeoutlen=250          " Time to wait after ESC (default causes an annoying delay)
set incsearch               " Incremental search results
set hlsearch                " highlight search results
" t - auto wrap text using textwidth
" c - auto wrap comments using textwidth
" q - allow formatting of comments with gq
" q - automatically insert the current comment leader after hitting <Enter> in
"     insert mode
set formatoptions=tcqr
set showmatch               " Show matching brackets.
set mat=5                   " Bracket blinking.
set novisualbell            " No blinking .
set noerrorbells            " No noise.


" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction

let g:ragtag_global_maps = 1 " ragtag global default bindings

" rebind my favorite commands from Git.vim for Fugitive
nmap <leader>ga :Gwrite<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gl :Glog 
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gr :Gremove
nmap <leader>gw :Gbrowse<cr>
nmap <leader>du :diffupdate<cr>
nmap <leader>gg :Ggrep 
nmap <leader>co :copen<cr>
nmap <leader>to :tabo \| only<cr>

" quickfix bindings
nmap <leader>cn :cn<cr>

" previous file
nmap <leader><leader> <C-^>

" ack binding
let g:ackprg="ack -H --nocolor --nogroup --column"
map <leader>a :Ack <C-r><C-w> 

" Shut the hell up NERD
let g:NERDShutUp=1

" This command annoys me
map K <Nop>

" Put a color line to help identify too-long lines
set colorcolumn=81

nmap <leader>R :RainbowParenthesesToggle<cr>

"Refresh CommandT
nmap <leader>r :CommandTFlush<cr>

set wildignore+=*.o,*.obj,.git,*.sql,*.png,*.ico,*.jp*g,*.gif,*.psd

" Optimizations for my evidently slow terminals
set showcmd
set scrolljump=5
hi NonText cterm=NONE ctermfg=NONE

:nmap <F1> <nop>

nmap <leader>m :make<cr>

silent! unmap <C-L>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" clear search buffer when hitting return
":nnoremap <CR> :nohlsearch<CR>

" Better have terminal pause disabled
:map <silent> <c-s> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
" Works in insert mode, skips confirm dialog
:imap <c-s> <c-o><c-s>

:map <silent> <c-q> :confirm q<CR>

" GVIM stuff
set guioptions+=lrbmTLce
set guioptions-=lrbmTLce
set guioptions+=c
" no autocopy
set guioptions-=a

set lsp=-4

" list and invisible characters
set list
set listchars=tab:»\ ,eol:¬

let g:instant_markdown_slow = 1

" do not complete with included files
set complete-=i

set tags+=gems.tags

let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.md'

" looks like i've got some inefficient syntax highlighting
set maxmempattern=2000

" airline config
let g:airline_theme='light'
let g:airline_powerline_fonts=0

source ~/.vim/per_machine_config
