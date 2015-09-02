" LilyPond filetype plugin
" Language:     LilyPond (ft=ly)
" Maintainer:   Heikki Junes <hjunes@cc.hut.fi>, Chris Wong <lambda.fairy@gmail.com>
" Last Change:  2012 Dec 29
"
" Installed As:	vim/ftplugin/lilypond.vim
" Uses Generated File:	vim/syntax/lilypond-words.el
"
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal autoindent
setlocal shiftwidth=4
"
" some handy key mappings
"
" <F4>  play midi
map <buffer> <F4> :w<Return>:!xdg-open %<.midi &<Return>
"
" <F5>  save & make everything
map <buffer> <F5> :w<Return>:se makeprg=lilypond\ %<<Return>:make<Return>
"
" <S-F5>  save & make and play midi
map <buffer> <S-F5> :w<Return>:se makeprg=lilypond\ %<<Return>:make<Return>:!xdg-open %<.midi &<Return>
"
" <F6>  view pdf
map <buffer> <F6> :!xdg-open %<.pdf &<Return>
"
" <S-F6>  view ps
map <buffer> <S-F6> :!xdg-open %<.ps &<Return>
"
" <F7>  prev error
map <buffer> <F7> :cp<Return>
"
" <F8>  next error
map <buffer> <F8> :cn<Return>
"
" <F9>  make
map <buffer> <F9> :w<Return>:se makeprg=make\ -k<Return>:make<Return>
"
" <F10> menu
source $VIMRUNTIME/menu.vim
setlocal wildmenu
setlocal cpo-=<
setlocal wcm=<C-Z>
map <buffer> <F10> :emenu <C-Z>
"
" <F12> comment region
map <buffer> <F12> :g!/%.*/normal 0i%<Return>
"
" <S-F12> remove comments in region
map <buffer> <S-F12> :g/%.*/normal 0x<Return>
"
" Completions in Insert/Replace-mode with <Ctrl-N>
setlocal dictionary-=$VIM/syntax/lilypond-words dictionary+=$VIM/syntax/lilypond-words
setlocal complete-=k complete+=k
"
setlocal showmatch
