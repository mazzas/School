" Vim syntax file
" Language: Monterey-Phoenix
" Maintainer: Steve Mazza
" Latest Revision: 29 JAN 2014

if exists("b:current_syntax")
  finish
else
  syntax clear
endif

syn case ignore

" Keywords
syn keyword basicLanguageKeywords FROM IN ALL SUCH THAT WITHIN 
syn keyword basicLanguageLabels ROOT SCHEMA 
syn keyword basicLanguageRepeats FOREACH 
syn keyword basicLanguageFunctions COORDINATE SHARE ADD PRECEDES SATISFIES INCLUDE EXTENDS
syn keyword montereyTodo contained TODO FIXME XXX NOTE

" Matches
syn match montereyComment "\v\/\/.*$" contains=montereyTodo skipwhite
syn match montereyIteration "\v\<\d+-\d+\>"
syn match montereyVariable "\v\$\w+"
syntax match montereyOperator "\v[\* \+ \|]"

" Regions
" syn region iterationBlock start=+<+ end=+>+ contains=montereyIteration
"syn region unorderedEventBlock start=+{+ end=+}+ fold transparent contains=basicLanguageKeywords, montereyIteration, montereyVariable, montereyOperator, basicLanguageLabels, basicLanguageRepeats, basicLanguageFunctions 
"syn region orderedEventBlock start=+(+ end=+)+ fold transparent contains=basicLanguageKeywords, montereyIteration, montereyVariable, montereyOperator, basicLanguageLabels, basicLanguageRepeats, basicLanguageFunctions 
"syn region optionalElementBlock start=+\[+ end=+\]+ fold transparent contains=basicLanguageKeywords, montereyIteration, montereyVariable, montereyOperator, basicLanguageLabels, basicLanguageRepeats, basicLanguageFunctions 

highlight link basicLanguageKeywords        Keyword
highlight link basicLanguageFunctions       Function
highlight link basicLanguageRepeats         Repeat
highlight link basicLanguageLabels          Label
highlight link montereyTodo                 Todo
highlight link montereyComment              Comment
highlight link montereyIteration            Number
highlight link montereyOperator             Operator
highlight link montereyVariable             Constant

let b:current_syntax = "monterey"
