set modeline
set nu

set smartindent
") So that it doesn't cock up comments.
au! FileType python setl nosmartindent

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!,!^F

set list!
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«

set hlsearch

set hidden

let html_no_rendering=1

map <silent> <C-O> :call BufferList()<CR>

set wildmode=longest,list
set wildmenu

set backupcopy=yes
