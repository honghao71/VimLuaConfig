" Enable Mouse
" set mouse=a

" Set Editor Font
" if exists(':GuiFont')
"     " Use GuiFont! to ignore font errors
"     GuiFont {font_name}:h{size}
" endif

" Set init fonsize 11. Alt+- minimize one size. Alt+= maxmize one size.
let s:fontsize = 11
:execute "GuiFont! Hack NFM:h" . s:fontsize
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Hack NFM:h" . s:fontsize
endfunction
noremap <c-=> :call AdjustFontSize(1)<CR>
noremap <c--> :call AdjustFontSize(-1)<CR>

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
" if exists(':GuiScrollBar')
"     GuiScrollBar 1
" endif

" Right Click Context Menu (Copy-Cut-Paste)
" nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
" vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
