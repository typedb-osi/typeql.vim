" Vim syntax file
" Language:     TypeQL.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  set iskeyword=@,48-57,_,-,192-246
elseif exists("b:current_syntax")
  finish
endif

if version < 600
  syntax clear
else
  setlocal iskeyword=@,48-57,_,192-246,-
endif

syn keyword typeqlKeyword    match get define undefine insert delete
syn keyword typeqlKeyword    offset limit sort asc desc
syn keyword typeqlKeyword    type abstract sub sub! owns @key regex
syn keyword typeqlKeyword    as plays relates when then
syn keyword typeqlKeyword    iid isa isa! has value is
syn keyword typeqlKeyword    group count max min mean median std sum

syn keyword typeqlOperator   like or not
syn match   typeqlOperator   "=\|!=\|>\|>=\|<\|<=\|contains"

syn keyword typeqlType       thing entity attribute relation role rule
syn keyword typeqlType       long string double boolean datetime

syn match   typeqlComment    "#.*$"

syn match   typeqlNumber     "\<[+-]\=[0-9]\+\>"
syn match   typeqlNumber     "\<[+-]\=[0-9]\+\.[0-9]\+\>"

syn keyword typeqlBoolean    true false
syn match   typeqlDate       "\<\([0-9]\{4\}\|[+-][0-9]\+\)-[0-1][0-9]-[0-3][0-9]\>"

syn region  typeqlString     start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region  typeqlString     start=+'+  skip=+\\\\\|\\'+  end=+'+

syn match   typeqlVariable   "\$\w\+"

if version >= 508 || !exists("did_typeql_syn_inits")
    if version < 508
        let did_typeql_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink typeqlKeyword       Keyword
    HiLink typeqlComment       Comment
    HiLink typeqlOperator      Operator
    HiLink typeqlType          Type
    HiLink typeqlNumber        Number
    HiLink typeqlBoolean       Number
    HiLink typeqlDate          Number
    HiLink typeqlString        String
    HiLink typeqlVariable      Identifier

    delcommand HiLink
endif

let b:current_syntax = "typeql"
