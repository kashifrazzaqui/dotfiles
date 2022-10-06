" Switch to buffer tabs
function! SwitchBufTab(ltr) range
  if v:count == 0
    let l:cmd = ':' . ((a:ltr == 1) ? "bnext" : "bprevious")
  else
    let l:cmd = ":exe 'b'.get(buftabline#user_buffers(), " . (v:count1 - 1) . ", '')"
  endif

  exe l:cmd
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        exec ':bd ' . old_name
        redraw!
    endif
endfunction
