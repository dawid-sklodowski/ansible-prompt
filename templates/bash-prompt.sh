# most likely, the __git_ps1() function has already been set by git-completion.bash
# at this point, but just in case it hasn't, we define a trimmed-down but otherwise
# fully functional version in here, to ensure that PS1 is meaningful in either case
type __git_ps1 > /dev/null 2>&1 ; [ $? -eq 0 ] || {
__git_ps1() {
		( [ -d .git ] && ( echo -n " [" ; git symbolic-ref HEAD | sed -e "s#^.*/##" | tr -d '\n' ; echo -n "]" ; ) ) || echo "" ;
	}
}

export GIT_PS1_SHOWDIRTYSTATE=true

# this function prints an exclamation mark at the
# start of the PS1 prompt if the previous command
# had a non-0 exit status if something went wrong
#
# if the previous command had a 0 exit status
# then it will check the $SHLVL, and print it
# out if it isn't 1 to indicate nested shells
__warning_prompt() {
	if [ $? -ne 0 ] ; then
		 echo -n " ! " ;
	elif [ $SHLVL -gt 1 ] ; then
		echo -n " ${SHLVL} " ;
	fi
}

# this is the actual definition of the "dynamic" PS1 prompt
# for interactive shells;  notice the dynamic invocation of
# the  "__git_ps1" function near the end of the PS1 prompt!
PS1="\[\e[0;31m\]\$(__warning_prompt)\[\e[0;36m\]\u@\h \[\e[0;35m\]\w\[\e[0;33m\]\$(__git_ps1)\[\e[0;0m\] $ " ;
