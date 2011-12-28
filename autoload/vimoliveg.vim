" Parser compiled on Thu 29 Dec 2011 06:54:41 AM CST,
" with VimPEG v0.2 and VimPEG Compiler v0.1
" from "vimoliveg.vimpeg"
" with the following grammar:

" ; ViMoLive - Vim Modeline Verifier (Parser)
" ; Barry Arthur, 2011 12 28
" 
" .skip_white = false
" .namespace = 'vimolive'
" .parser_name = 'vimolive#parser'
" .root_element = 'modeline'
" 
" vitag      ::=  'vi:'
" vimtag     ::=  'vim' vers? ':'
" extag      ::=  'ex:'
" tag1       ::=  vimtag | vitag
" tag2       ::=  tag1 | extag
" leader1    ::=  (ospace lotext)* space tag2
" leader2    ::=  tag1
" leader     ::=  leader1 | leader2
" modeline1  ::=  leader ospace m1_options colon? ospace
" modeline2  ::=  leader ospace set m2_options colon totext
" modeline   ::=  '^' (modeline2 | modeline1) '$'
" 
" vers       ::=  comp num | num
" comp       ::=  '<' | '=' | '>'
" num        ::=  '\d\{3}'
" lotext     ::=  !tag2 '\S\+'
" totext     ::=  '.*'
" ospace     ::=  '\s*'
" space      ::=  '\s\+'
" set        ::=  'set\? \s*'
" colon      ::=  '\s*:'
" 
" m1_options ::=  option (colons option)*
" m2_options ::=  option (colons option &colon)*
" option     ::=  val_opt | tag_opt
" tag_opt    ::=  '[a-z]\+'
" val_opt    ::=  tag_opt assignment
" assignment ::=  '\s*=' !'\s' value
" value      ::=  ('\\:' | !'\\' '[^ :]')+
" colons     ::=  colon* ospace

let s:p = vimpeg#parser({'root_element': 'modeline', 'skip_white': 0, 'parser_name': 'vimolive#parser', 'namespace': 'vimolive'})
call s:p.e('vi:',
      \{'id': 'vitag'})
call s:p.and([s:p.e('vim'), s:p.maybe_one('vers'), s:p.e(':')],
      \{'id': 'vimtag'})
call s:p.e('ex:',
      \{'id': 'extag'})
call s:p.or(['vimtag', 'vitag'],
      \{'id': 'tag1'})
call s:p.or(['tag1', 'extag'],
      \{'id': 'tag2'})
call s:p.and([s:p.maybe_many(s:p.and(['ospace', 'lotext'])), 'space', 'tag2'],
      \{'id': 'leader1'})
call s:p.and(['tag1'],
      \{'id': 'leader2'})
call s:p.or(['leader1', 'leader2'],
      \{'id': 'leader'})
call s:p.and(['leader', 'ospace', 'm1_options', s:p.maybe_one('colon'), 'ospace'],
      \{'id': 'modeline1'})
call s:p.and(['leader', 'ospace', 'set', 'm2_options', 'colon', 'totext'],
      \{'id': 'modeline2'})
call s:p.and([s:p.e('^'), s:p.or(['modeline2', 'modeline1']), s:p.e('$')],
      \{'id': 'modeline'})
call s:p.or([s:p.and(['comp', 'num']), 'num'],
      \{'id': 'vers'})
call s:p.or([s:p.e('<'), s:p.e('='), s:p.e('>')],
      \{'id': 'comp'})
call s:p.e('\d\{3}',
      \{'id': 'num'})
call s:p.and([s:p.not_has('tag2'), s:p.e('\S\+')],
      \{'id': 'lotext'})
call s:p.e('.*',
      \{'id': 'totext'})
call s:p.e('\s*',
      \{'id': 'ospace'})
call s:p.e('\s\+',
      \{'id': 'space'})
call s:p.e('set\?\s*',
      \{'id': 'set'})
call s:p.e('\s*:',
      \{'id': 'colon'})
call s:p.and(['option', s:p.maybe_many(s:p.and(['colons', 'option']))],
      \{'id': 'm1_options'})
call s:p.and(['option', s:p.maybe_many(s:p.and(['colons', 'option', s:p.has('colon')]))],
      \{'id': 'm2_options'})
call s:p.or(['val_opt', 'tag_opt'],
      \{'id': 'option'})
call s:p.e('[a-z]\+',
      \{'id': 'tag_opt'})
call s:p.and(['tag_opt', 'assignment'],
      \{'id': 'val_opt'})
call s:p.and([s:p.e('\s*='), s:p.not_has(s:p.e('\s')), 'value'],
      \{'id': 'assignment'})
call s:p.many(s:p.or([s:p.e('\\:'), s:p.and([s:p.not_has(s:p.e('\\')), s:p.e('[^:]')])]),
      \{'id': 'value'})
call s:p.and([s:p.maybe_many('colon'), 'ospace'],
      \{'id': 'colons'})

let g:vimolive#parser = s:p.GetSym('modeline')
