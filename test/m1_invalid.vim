" only vim tags can have version numbers
echo VerifyModeline('vi700: o')
echo VerifyModeline('ex700: o')

" ex tags can't start at ^
echo VerifyModeline('ex: o')

" can't omit whitespace between leading optional text and tag
echo VerifyModeline('foovi: o')
echo VerifyModeline('foovim: o')
echo VerifyModeline('foovim600: o')
echo VerifyModeline('fooex: o')

" can't omit : on tag
echo VerifyModeline('vim620 o')
echo VerifyModeline('foo vi o')
echo VerifyModeline('foo vim o')
echo VerifyModeline('foo vim560 o')
echo VerifyModeline('foo ex o')
echo VerifyModeline('   vi o')
echo VerifyModeline('   vim o')
echo VerifyModeline('   vim700 o')
echo VerifyModeline('   ex o')


