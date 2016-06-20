" Vim Dragon Curve 1.0 October 2014
" A fractal in less than 256 bytes of Vim Script
" Usgae:
"   Source this file.
"   Press and hold F2.
"   For greatest value, create a document with many empty line, and place the
"   cursor in the middle of the screen.
" Author:
"   Rolf Asmund
let a=0
let b=''
let d=0
set ve=all
map <F2> :let @c=d>2?"lr_l":d>1?"jr\|":d?"hr_h":"r\|k"<CR>@c:let e=a!=0&&b[a-1]=='v'\|:let b.=e?'h':'v'\|:let a=(a==0?len(b):a)-1\|let d=(d+(e=='v'?1:3))%4<CR>
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
