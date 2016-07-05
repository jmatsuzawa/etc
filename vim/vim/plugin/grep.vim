source ${HOME}/.vim/lib/tmp_window.vim

function! s:grep(...)
  let l:cmd = s:gen_cmd(a:000)
  call Cmd_on_tmp_window(l:cmd)
"  setl nomodifiable
  wincmd J
  call s:set_winheight()
endfunction

function! s:gen_cmd(argv)
  return 'grep -nH ' . join(a:argv)
endfunction

function! s:set_winheight()
  let l:height = &lines / 4
  exec "norm! " . l:height . "\<C-W>_"
endfunction


command! -nargs=+ Grep call s:grep(<f-args>)
