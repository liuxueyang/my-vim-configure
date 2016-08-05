" set guifont on Mac OS X, Linux and Windows
if has('mac')
  se gfn=Monaco:h19
else
  se gfn=Hermit\ 11
endif

"remove toolbar, menu"
se go-=T go-=m gcr=a:block-blinkon0
