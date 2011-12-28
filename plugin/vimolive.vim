function! VerifyModeline(line)
  let res = g:vimolive#parser.match(a:line)
  "if res['is_matched'] != 1
    "echo string(res)
  "endif
  return res['is_matched'] . ' -> ' . string(a:line)
endfunction
