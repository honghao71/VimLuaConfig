local cmd = vim.cmd
function HH_lockTableHead()
    cmd("set nowrap")
    cmd("?|---")
    cmd("normal! k")
    cmd("nohl")
    cmd("top 2split")
    cmd("set scrollbind")
    cmd("set laststatus=3")
    cmd("wincmd p")
    cmd("set scrollbind")
    cmd("set scrollopt=hor")
end
function HH_unlockTableHead()
    cmd("quit")
    cmd("set noscrollbind")
    cmd("set laststatus=2")
    cmd("set scrollopt=ver,jump")
end
