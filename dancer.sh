# ---------------------------------------------------------------------------
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export mystuff=$HOME/src/mystuff

export FORTUNE_FILE=$HOME/src/mystuff/fortunes/fortunes
export DFSPACE_OPTS='-t vfat'

export SCALA_HOME=$HOME/scala/scala-2.8.0

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$SCALA_HOME/bin:\
$HOME/python/bin:\
/usr/bin:\
/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:

# ---------------------------------------------------------------------------
# Aliases and functions

alias ftp=ncftp
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"
alias mypy='varcd mypy'
#alias top=htop

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:$HOME/lib

