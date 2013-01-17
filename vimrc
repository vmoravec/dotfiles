" hide this unless you run debian
"runtime! debian.vim
"   ----------------  GENERAL ----------------
set autowrite                   " Automatically save before commands like :next and :make
set hidden                      " Hide buffers when they are abandoned
set nocompatible
set viminfo^=!
set cf                          " Enable error files & error jumping
set clipboard+=unnamed          " Yanks go on clipboard instead
set history=256                 " Number of thins to remember in history
set wrap
set timeoutlen=250              " Time towait after ESC
set cursorline                  " Highlights the line with cursor
"   ----------------  TABS  ------------------
set ts=2                        " Tabs are 2 spaces
set bs=2                        " Backspace over everything in insert mode
set shiftwidth=2                " Tabs under smart indent
"   ----------------  SEARCH  ------------------
set ignorecase                  " Do case insensitive matching
set incsearch                   " Incremental search
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
set autoindent
set smarttab
set expandtab
set wmh=0
"   ----------------  VISUAL  ------------------
set showmatch                    " Show matching brackets
set mat=2                        " Bracket blinking
set list
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell                 " No blinking
set noerrorbells                 " No noise
set laststatus=2                 " Always show status line
set mouse=a                      " Mouse in all modes -> gvim
set number                       " Show line numbers
set ruler                        " Ruler on
"   ----------------  VARIOUS  ------------------
syntax on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.config set filetype=ruby
au BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufWritePre *.{rb,js} :%s/\s\+$//e
"   -------------  PATHOGEN --------------------
call pathogen#infect()
"   ----------------  COLORS  ------------------
 colorscheme grey_background
"  ---------------  SOLARIZED  ------------------ "
" syntax enable
" set background=dark
" colorscheme solarized
"  ----------------  BACKUP  ------------------
set nobackup
set nowritebackup
set noswapfile
"   ----------------- RESIZE  ------------------
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>
inoremap <S-CR> <Esc>
"   ----------------  NERDTREE   ---------------
nmap <F7> :NERDTreeToggle <CR>
let NERDTreeWinPos="left"
let NERDTreeWinSize=40
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>
set wmw=0
autocmd vimenter * if !argc() | NERDTree | endif
"   -------------  ESCAPE INSERT MODE  ---------
map <S-Enter> O<Esc>j
"   -------------  INSERT IN NORMAL MODE -------
" map <S-Enter> O<Esc>
" map <CR> o<Esc>
map <S-Enter> O<Esc>j
map <CR> o<Esc>k
:nnoremap <Space> i<Space><Esc>
"   -------------  FONT ------------------------
set gfn=Monospace\ 10\.7
set guicursor=a:blinkon0
"   -------------  FUGITIVE --------------------
set statusline=%<%f\ %h%m%r%#Git#\ %{fugitive#statusline()}\ %#StatusLine#\ %=%-14.(%l,%c%V%)\ %P
"   -------------  OVERLENGTH ------------------
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
"   ---------------  GUI CONDITIONS  ----------
if has("gui_running")
  if has("gui_gtk2")
    set noballooneval
  else
    " set other values
  endif
endif
"   -------------  COMMENTS   -----------------
" perl
map ,# :s/^/#/<CR>
" C/C++/C#/Java
map ,/ :s/^/\/\//<CR>
" HTML
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

"   -------------  TIMESTAMP F3   -----------------
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

"   --------------- TAB CLOSING ------------------------
"   ---------------- SWITCHING HIGHLIGHTING OF LINE -----
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"   -------------  RUBY FOLDING -----------------
" FoldSearch-based folding.
" Copyright (C) 2005 Mauricio Fernandez <mfp@acm.org>
" Current version: http://eigenclass.org/hiki.rb?Usable+Ruby+folding+for+Vim
"
" Add this to your .vimrc and fold with :R. The default fold expression will
" work with Ruby scripts; you can specify where folds start with
" let b:foldsearchexpr = 'myexpression'
" e.g.
"  let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
" or so for Java.
" One way to have this buffer-local variable set is
" au Filetype java let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
"
" It is possible to have comments above a method/class/etc be included in the
" fold, by setting b:foldsearchprefix. All the lines above the detected fold
" matching b:foldsearchprefix will be included in said fold.
" For instance, for Ruby code:
"   let b:foldsearchprefix = '\v^\s*(#.*)?$'
" which can be automated with
"   au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'
"
" Changelog:
" 2005-12-12  1.1  use b:foldsearchprefix to prepend comments to a fold.

"{{{ set s:sid

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

"{{{ FoldText
function! s:Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
  let linenum = v:foldstart
  while linenum <= v:foldend
      let line = getline(linenum)
      if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
    break
      else
    let linenum = linenum + 1
      endif
  endwhile
  if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
      " all lines matched the prefix regexp
      let line = getline(v:foldstart)
  endif
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let diff = v:foldend - v:foldstart + 1
  return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

"Fs pattern Fold search
"Vimtip put to good use by Ralph Amissah zxy@irc.freenode.net
"Modified by Mauricio Fernandez <mfp@acm.org>
function! Foldsearch(search)
  setlocal fdm=manual
  let origlineno = line(".")
  normal zE
  normal G$
  let folded = 0     "flag to set when a fold is found
  let flags = "w"    "allow wrapping in the search
  let line1 =  0     "set marker for beginning of fold
  if a:search == ""
      if exists("b:foldsearchexpr")
    let searchre = b:foldsearchexpr
      else
    "Default value, suitable for Ruby scripts
    "\(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
    let searchre = '\v(^\s*(def|class|module|attr_reader|attr_accessor|alias_method)\s' . 
                 \ '|^\s*\w+attr_(reader|accessor)\s|^\s*[#%"0-9]{0,4}\s*\{(\{\{|!!))' .
                 \ '|^\s*[A-Z]\w+\s*\='
    let b:foldsearchexpr = searchre
      endif
  else
      let searchre = a:search
  endif
  while search(searchre, flags) > 0
    let  line2 = line(".")
    while line2 - 1 >= line1 && line2 - 1 > 0 "sanity check
       let prevline = getline(line2 - 1)
       if exists("b:foldsearchprefix") && (match(prevline, b:foldsearchprefix) != -1)
           let line2 = line2 - 1
       else
           break
       endif
    endwhile
    if (line2 -1 >= line1)
      execute ":" . line1 . "," . (line2-1) . "fold"
      let folded = 1       "at least one fold has been found
    endif
    let line1 = line2     "update marker
    let flags = "W"       "turn off wrapping
  endwhile
  normal $G
  let  line2 = line(".")
  if (line2  >= line1 && folded == 1)
    execute ":". line1 . "," . line2 . "fold"
  endif
  execute "normal " . origlineno . "G"
endfunction

"{{{~folds Fold Patterns
" Command is executed as ':Fs pattern'"
command! -nargs=? -complete=command Fs call Foldsearch(<q-args>)
command! -nargs=? -complete=command Fold call Foldsearch(<q-args>)
"command! R Fs \(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
command! R Fs 

