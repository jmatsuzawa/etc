source ${HOME}/.vim/lib/get_file_line.vim

function! JumpAt(...)
  let l:fname_line = Get_file_line(getline('.'))
  if ! s:is_valid(l:fname_line)
    return
  endif
  let l:fname = l:fname_line[0]
  let l:line = l:fname_line[1]
  let l:cmd = s:get_open_cmd(a:0, a:000)
"  exec "sp +" . l:line . " " . l:fname
  call s:open_file(cmd, l:line, l:fname)
endfunction


function! s:is_valid(fname)
  if type(a:fname) == type(0) && a:fname == -1
    return 0
  endif
  return 1
endfunction


function! s:get_open_cmd(argc, argv)
  let l:cmd = "split"
  if a:argc > 0
    let l:cmd = a:argv[0]
  endif
  return l:cmd
endfunction


function! s:open_file(open, line, fname)
  exec a:open . " +" . a:line . " " . a:fname
endfunction


nmap <C-j><C-j> :call JumpAt()<CR>
nmap <C-j>j :call JumpAt()<CR>
nmap <C-j><C-t> :call JumpAt("tabnew")<CR>
nmap <C-j>t :call JumpAt("tabnew")<CR>
