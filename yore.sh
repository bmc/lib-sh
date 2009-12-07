# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export mystuff=$HOME/src/mystuff
export mypy=$mystuff/python

export PYTHONPATH=$HOME/lib/python:$HOME/google_appengine

export FORTUNE_FILE=$HOME/lib/games/fortunes

#export JYTHON_HOME=/home/bmc/java/jython/dist
#export JRUBY_HOME=/home/bmc/java/jruby
#export SCALA_HOME=/usr/local/scala/scala

# ---------------------------------------------------------------------------

#load_file ~/bash/java.sh

#eval `classpath -k -J`

#add_dir_contents_to_classpath /usr/share/java

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$HOME/python/bin:\
/usr/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:

# ---------------------------------------------------------------------------
# Programmatic Completion

unset -f _get_vpn_completions
_get_vpn_completions()
{
    local cur prev possibles
    # "cur" is the current word (the one being completed)
    cur="${COMP_WORDS[COMP_CWORD]}"
    # prev is the previous word type. We don't use that here.
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # COMPREPLY is a bash array in which the responses are returned
    COMPREPLY=()

    # Generate the list of possible matches (i.e., the directories under
    # $HOME/openvpn
    possibles=
    for f in $HOME/openvpn/*
    do
        if [ -d $f ]
        then
            possibles="$possibles $(basename $f)"
        fi
    done

    # Now, use the compgen built-in to generate the matches
    COMPREPLY=( $(compgen -W "$possibles" -- $cur) )
}
# enable completions on command "vpn"
complete -F _get_vpn_completions vpn

# ---------------------------------------------------------------------------
# Aliases and functions

alias ftp=ncftp
alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"
alias mypy='varcd mypy'
alias top=htop

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

load_file ~/bash/ubuntu.sh

