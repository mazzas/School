" Vim syntax file
" Language: Monterey-Phoenix
" Maintainer: Steve Mazza
" Latest Revision: 27 JAN 2014

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword basicLanguageKeywords ROOT COORDINATE FROM IN
syn keyword basicLanguageKeywords SHARE ALL ADD PRECEDES |
syn keyword basicLanguageKeywords SATISFIES FOREACH SUCH THAT
syn keyword basicLanguageKeywords SCHEMA INCLUDE WITHIN EXTENDS
syn keyword celTodo contained TODO FIXME XXX NOTE

" Matches
" syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite
syn match celComment "\/\/.*$" contains=celTodo

" Regions
syn region unorderedEventBlock start="{" end="}" fold transparent contains=basicLanguageKeywords
syn region unorderedIterationBlock start="{*" end="*}" fold transparent contains=basicLanguageKeywords
syn region unorderedIterationBlock2 start="{+" end="+}" fold transparent contains=basicLanguageKeywords
syn region orderedEventBlock start="(" end=")" fold transparent contains=basicLanguageKeywords
syn region orderedIterationBlock start="(*" end="*)" fold transparent contains=basicLanguageKeywords
syn region orderedIterationBlock start="(+" end="+)" fold transparent contains=basicLanguageKeywords
syn region optionalElementBlock start="\[" end="\]" fold transparent contains=basicLanguageKeywords

hi def link basicLanguageKeywords Statement
hi def link celTodo        Todo
hi def link celComment     Comment

