" Vim syntax file
" Language:     Regret (Paul Chamberlain/Alchemy Systems)
" Maintainer:   Jayson Crisman <jay.crisman@alchemysystems.com>
" Last Change:  2007 Aug 16

" Remove any old syntax stuff hanging around (this is suppressed
" automatically by ":syn include" if necessary).
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" regret commands
syn match rgrRegex      ".*$"
syn match rgrRegex1	".*$"                  contained
syn match rgrRegex2	".*$"                  contained
syn match rgrArgs       ".*$"
syn match rgrNumber	"\<[0-9]*\>"
syn match rgrForm1	"\S\+"                 nextgroup=rgrRegex1 skipwhite
syn match rgrField      "\S\+"                 nextgroup=rgrRegex2 skipwhite
syn match rgrForm2	"\S\+"                 nextgroup=rgrField skipwhite
syn match rgrForm3	"\S\+"			nextgroup=rgrGotoUrl skipwhite
syn match rgrOption	"\(restrict\|dorefresh\|checkimages\|url_prefix\)\s\+.*$"
" absolute URL
" syn match rgrGotoUrl    "\S\+$" contained
syn match rgrGotoUrl '\(\(\(https\=\|ftp\)://[-.[:alnum:]_\\]\+/\)\|\(\.\./\)\|\(\./\)\|\(/\)\)\=\([-%./[:alnum:]_]\+\)\=\(?[-=%&[:alnum:]_\\]\+\)\=\(#[-%[:alnum:]_\\\[\]]\+\)\=$' contained
syn match Error		"^.*$"
syn match rgrComment    "^#.*$" 	       contains=rgrTodo
syn match rgrCommand    "^goto\s\+\c"          nextgroup=rgrGotoUrl
syn match Todo		"^exit\s\+\c"
syn match rgrCommand    "^follow\s\+\c"        nextgroup=rgrRegex
syn match rgrCommand	"^globalerror\s\+\c"   nextgroup=rgrRegex
syn match rgrCommand    "^include\s\+\c"       nextgroup=rgrArgs
syn match rgrCommand    "^randtext\s\+\c"      nextgroup=rgrArgs
syn match rgrCommand    "^log\s\+\c"           nextgroup=rgrArgs
syn match rgrCommand    "^save\s\+\c"          nextgroup=rgrArgs
syn match rgrCommand    "^dumpform\s\+\c"      nextgroup=rgrArgs
syn match rgrCommand    "^back\s\+\c" 
syn match rgrCommand    "^skipto\s\+\c"        nextgroup=rgrRegex skipwhite
syn match rgrCommand    "^skiphtml\s\+\c"      nextgroup=rgrRegex skipwhite
syn match rgrCommand	"^post\s\+\c"		nextgroup=rgrForm3 skipwhite
syn match rgrCommand    "^scanbody\s\+\c"      nextgroup=rgrRegex skipwhite
syn match rgrCommand    "^checkbody\s\+\c"     nextgroup=rgrRegex skipwhite
syn match rgrCommand    "^storematches\s\+\c"  nextgroup=rgrRegex skipwhite
syn match rgrCommand    "^storematchesg\s\+\c" nextgroup=rgrRegex skipwhite
syn match rgrCommand    "^fillin\s\+\c"        nextgroup=rgrForm2 skipwhite
syn match rgrCommand    "^select\s\+\c"        nextgroup=rgrForm2 skipwhite
syn match rgrCommand    "^click\s\+\c"         nextgroup=rgrForm1 skipwhite
syn match rgrCommand	"^option\s\+\c"	       nextgroup=rgrOption
syn match rgrCommand	"^deselect\s\+\c"      nextgroup=rgrForm2 skipwhite
syn match rgrComment	"^nocomment\s\+.*\c"
syn match rgrCommand	"^!\s\+"	       nextgroup=rgrSpecial
syn keyword rgrTodo FIXME contained
syn keyword rgrTodo NOTE contained
syn keyword rgrTodo IMPORTANT contained

syn region rgrComment matchgroup=rgrComment start="^comment.*$" end="^nocomment.*$"

if version >= 508 || !exists("did_rgr_syntax_inits")
  if version < 508
    let did_rgr_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink rgrCommand             Identifier
  HiLink rgrRegex               Special
  HiLink rgrRegex1		Special
  HiLink rgrRegex2		Special
  HiLink rgrGotoUrl             Underlined
  HiLink rgrComment             Comment
  HiLink rgrNumber		Number
  HiLink rgrSpecial		Constant
  HiLink rgrArgs		String
  HiLink rgrTodo		Todo
  HiLink rgrForm1		String
  HiLink rgrForm2		String
  HiLink rgrField		String

  delcommand HiLink
endif

