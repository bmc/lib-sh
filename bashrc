# $Id$

if [ -n "$_xinit" ]
then
    echo "Fired up from within xinit(1). Pulling in /etc files manually."
    . /etc/profile
fi

. ~bmc/bash/csh-funcs.sh
. ~bmc/bash/misc-funcs.sh
. ~bmc/bash/path.sh

load_file ~bmc/bash/dir-functions.sh

# ---------------------------------------------------------------------------
# Path setting

export PATH
PATH=$HOME/bin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin

# ---------------------------------------------------------------------------
# Environment settings.  Done here instead of .login because they're needed
# before .login is read (and .tcshrc is read before .login).  The .login
# file is also not read by remotely executed (rsh) commands.

if [ -z $LD_LIBRARY_PATH ]
then
    export LD_LIBRARY_PATH="/usr/X11R6/lib"
fi

# Ensure that $HOME is set to the real thing, even if what's in /etc/passwd
# specifies a symlink

getHome HOME
export HOME

export XWINHOME=/usr/X11R6
export DISPLAY=":0.0"
export PLATFORM=`platform`
export pager="less"
export PAGER="$pager -s"
export LESS='-aEfwiP?f%f:-- More --. ?pB(%pB\%). '
export LESSCHARSET="latin1"
export editor="ew"
export EDITOR=emacs
export VISUAL=$EDITOR
export CVSEDITOR=vi
export ELM_EDITOR="$EDITOR"
export GZIP="-9"

export HOST=`hostname`
HOST=${HOST%%.*}

export DOMAIN=`domain`

# Version of less(1) greater than 332 permit you to define a LESSOPEN
# variable, to point to a preprocessor script. That script can do various
# things, including uncompress or gunzipping a file, running a file through
# nroff, etc. Less will pipe through that script if LESSOPEN is defined.
# However, it really slows things down. Just in case one of the system files
# defines LESSOPEN, undefine it here.

unset LESSOPEN

if [ -z $MANPATH ]
then
    export MANPATH="/usr/man"
fi

#export CDPATH=..:$HOME:$HOME/src:$HOME/docs

umask 022

# ---------------------------------------------------------------------------
# Variable settings that control misc. shell behavior

# Force an ellipsis in the prompt if it exceeds 30 characters. See
# mkprompt() function in misc-funcs.sh

max_prompt_len=30

# ---------------------------------------------------------------------------
# Aliases and functions that implement aliases

alias a=alias
alias back='chdir $OLDPWD'
alias bytecomp="emacs -batch -f batch-byte-compile"
alias cls=clear
alias d="ls -CF"
alias e=$editor
alias enw='emacs -nw'
alias f=finger
alias fiel=file
alias h="history"
alias l=d
alias lj="fg %-"
alias ls='ls -CF'
alias ll='ls -lF'
alias more=$pager
alias mroe=$pager
alias mllog="taillog /var/log/maillog"
alias mslog="taillog /var/log/messages"
alias moer=$pager
alias pign=ping
alias psme='ps -ef | egrep "^USER|$user"'
alias r="fc -s"     # emulate Korn shell's "r" command
alias rot13='tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"'
alias smtpr=smtp-test-relay
alias time=/bin/time
alias whois=nwhois
alias which=type
alias xrdb="xrdb -DHOME='$HOME'"
alias xs='eval `resize -u`'
alias z="echo Rereading $HOME/.bashrc ... ; source $HOME/.bashrc"

manf()
{
    nroff -man $1.[1-8m]* | $pager
}

taillog()
{
    : ${1?'missing log file parameter'}

    echo "+ tail -f $1"
    tail -f $1
}

# ---------------------------------------------------------------------------
# Other files

load_file	~bmc/bash/$PLATFORM.sh
load_file	~bmc/bash/$HOST.sh
load_file	~bmc/bash/$DOMAIN.sh

cleanpath --rm . PATH
cleanpath CLASSPATH LD_LIBRARY_PATH

# ***************************************************************************
# ***************************************************************************
# ***************************************************************************

# Stuff that should only be done for interactive shells.

if interactive
then

# Allow a larger history

HISTSIZE=1024

# Don't bother checking mail from the shell. We have nice graphics tools for
# that.

MAILCHECK=0

# ---------------------------------------------------------------------------
# Shell key bindings.

set -o emacs			# Use GNU Emacs bindings

function checkKey
{
    case "${.sh.edchar}" in

    ) clear
        ;;

    esac        
}

# NOTE: This messes with the META sequences.
#trap 'checkKey' KEYBD

# ---------------------------------------------------------------------------
# Set the prompt string.

if [ $UID == 0 ]
then
    _prompt='#'
else
    _prompt='$'
fi

export PS1='($HOST:$USER) ${PWD/$HOME/~} '"$_prompt"' '

# ---------------------------------------------------------------------------
# Misc.

alias clear='echo -n `tput clear`'
alias cls='clear'

term $TERM
mkprompt

# NOTE: -istrip has to be set for xterm to pass through 8-bit characters.

stty erase '^h' kill '^u' intr '^c' echok echoe -istrip

fi # interactive

# ***************************************************************************
# ***************************************************************************
# ***************************************************************************
