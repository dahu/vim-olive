" only vim tags can have version numbers
echo VerifyModeline('vi700:set  o:')
echo VerifyModeline('ex700:set  o:')

" ex tags can't start at ^
echo VerifyModeline('ex:set  o:')

" can't omit whitespace between leading optional text and tag
echo VerifyModeline('foovi:set  o:')
echo VerifyModeline('foovim:set  o:')
echo VerifyModeline('foovim600:set  o:')
echo VerifyModeline('fooex:set  o:')

" can't omit :set  on tag
echo VerifyModeline('vim620 o:')
echo VerifyModeline('foo vi o:')
echo VerifyModeline('foo vim o:')
echo VerifyModeline('foo vim560 o:')
echo VerifyModeline('foo ex o:')
echo VerifyModeline('   vi o:')
echo VerifyModeline('   vim o:')
echo VerifyModeline('   vim700 o:')
echo VerifyModeline('   ex o:')


" only vim tags can have version numbers
echo VerifyModeline('vi700: set  o:')
echo VerifyModeline('ex700: set  o:')

" ex tags can't start at ^
echo VerifyModeline('ex: set  o:')

" can't omit whitespace between leading optional text and tag
echo VerifyModeline('foovi: set  o:')
echo VerifyModeline('foovim: set  o:')
echo VerifyModeline('foovim600: set  o:')
echo VerifyModeline('fooex: set  o:')

" can't omit : set  on tag
echo VerifyModeline('vim620 o:')
echo VerifyModeline('foo vi o:')
echo VerifyModeline('foo vim o:')
echo VerifyModeline('foo vim560 o:')
echo VerifyModeline('foo ex o:')
echo VerifyModeline('   vi o:')
echo VerifyModeline('   vim o:')
echo VerifyModeline('   vim700 o:')
echo VerifyModeline('   ex o:')


