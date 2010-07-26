# _read_etc_profile is set in /etc/profile, if it's been read already
if [ -z "$_read_etc_profile" ]
then
    . /etc/profile
fi

. ~/bash/csh-funcs.sh
. ~/bash/misc-funcs.sh
. ~/bash/path.sh

load_file ~/bash/dir-functions.sh

# ---------------------------------------------------------------------------
# Path setting

export PATH
PATH="$HOME/bin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin"

# ---------------------------------------------------------------------------
# Environment settings.

if [ -z "$LD_LIBRARY_PATH" ]
then
    export LD_LIBRARY_PATH="/usr/X11R6/lib"
fi

# Ensure that $HOME is set to the real thing, even if what's in /etc/passwd
# specifies a symlink


getHome HOME
export HOME

export XWINHOME=/usr/X11R6
#export DISPLAY=":0.0"
export PLATFORM=`platform`
export pager="less"
export PAGER="$pager -s"

# Less, version 352 (or thereabouts)
#export LESS='-aEfwiP?f%f:-- More --. ?pB(%pB\%). '

# Newer versions of less
export LESS='-RME -PM -- More ?PB(%PB\%) :--'

export LESSCHARSET="latin1"
export editor="ew"
export EDITOR=emacs
export VISUAL=$EDITOR
export CVSEDITOR=vi
export GIT_EDITOR=vi
export SVN_EDITOR=vi
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

if [ -z "$MANPATH" ]
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

# Automatic correction for minor spelling mistakes.

shopt -s cdspell

# Local to this set of files: This variable contains the mapping for
# "stty erase". By default, it's "^h", but files pulled in by load_file
# can override it.

stty_erase="^h"

# ---------------------------------------------------------------------------
# Aliases and functions that implement aliases

alias a=alias
alias back='chdir $OLDPWD'
alias bytecomp="emacs -batch -f batch-byte-compile"
alias cd..='cd ..'
alias cls=clear
alias d="ls -CF"
alias e=$editor
alias enw='emacs -nw'
alias f=finger
alias fiel=file
alias giturl="git config --get remote.origin.url"
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
alias rm-rf="rm -rf"
alias smtpr=smtp-test-relay
alias svnurl="svn info|awk '/^URL:/ {print \$2}'"
alias which=type
alias xrdb="xrdb -DHOME='$HOME'"
alias xs='eval `resize -u`'
alias z="echo Rereading $HOME/bash/bashrc ... ; source "'"$HOME"'"/bash/bashrc"

# ---------------------------------------------------------------------------
# X stuff

# Where have I logged in from? Note: LOGIN_RHOST must be set before the
# platform, host and domain files are pulled in, below.

export LOGIN_RHOST=`login-from | sed 's/\..*$//'`

if [ -z "$DISPLAY" ]
then
    case "$LOGIN_RHOST" in
        localhost|""|$HOST.$DOMAIN)
            xdisplay :0.0
            ;;
        *)
            xdisplay $LOGIN_RHOST
	    ;;
    esac
fi

# ---------------------------------------------------------------------------
# Other files

load_file	~/bash/$PLATFORM.sh
load_file	~/bash/$DOMAIN.sh
load_file	~/bash/$HOST.sh

#cleanpath --rm . PATH
cleanpath PATH
cleanpath CLASSPATH LD_LIBRARY_PATH PYTHONPATH

# ***************************************************************************
# ***************************************************************************
# ***************************************************************************

# Stuff that should only be done for interactive shells.

if interactive
then

# Allow a larger history

HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTCONTROL=ignoredups

# Don't bother checking mail from the shell. We have nice graphics tools for
# that.

MAILCHECK=0

# ---------------------------------------------------------------------------
# Shell key bindings.

set -o emacs			# Use GNU Emacs bindings

# ---------------------------------------------------------------------------
# Set the prompt string.

if [ $UID == 0 ]
then
    _prompt='#'
else
    _prompt='$'
fi

# ---------------------------------------------------------------------------
# Misc.

alias clear='echo -n `tput clear`'
alias cls='clear'

term $TERM
mkprompt

# NOTE: -istrip has to be set for xterm to pass through 8-bit characters.

stty erase $stty_erase kill '^u' intr '^c' echok echoe -istrip

# Ignore CVS subdirectories when processing TAB expansions for the "cd" command

complete -X 'CVS' -A directory cd
complete -X '*/CVS' -A directory cd
complete -X '.svn' -A directory cd

fi # interactive

# ***************************************************************************
# ***************************************************************************
# ***************************************************************************
