" set guifont on Mac OS X, Linux and Windows
if has('mac')
  se gfn=Monaco:h19
elseif has("gui_win32")
  set gfn=Hermit:h13:b:cANSI
  "set gfw=楷体:h13:b:cGB2312
  "想把中英文设置成不同字体，但是没找到好方法
else
  se gfn=Hermit\ 11
endif

"remove toolbar, menu"
se go-=T go-=m gcr=a:block-blinkon0
"color molokai
color darkblue
