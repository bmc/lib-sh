# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=/usr/local/lib/perl
export www=/usr/local/www
export APACHE_HOME=$www
export TOMCAT_HOME=$APACHE_HOME/tomcat
export CVSROOT=":pserver:bmc@condor.inside.clapper.org:/usr/local/src/my-stuff/CVS-tree"

# ---------------------------------------------------------------------------

# Linux prefers ^? for the backspace key. The stty command is actually issued
# in bashrc, but the erase character is taken from the stty_erase variable.

if [ "$LOGIN_RHOST" = "localhost" -o \
     "$LOGIN_RHOST" = "$HOSTNAME" -o \
     "$LOGIN_RHOST" = "$HOST" ]
then
    stty_erase="^?"
fi

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=/usr/local/java
export ANT_HOME=/usr/local/java/ant

if [ -n "$JAVA_HOME" ]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=/usr/local/java/jdk
fi

eval `classpath -k -J`

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$PATH:\
$JAVA_HOME/bin:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
$ORACLE_HOME/bin:\
$ANT_HOME/bin:\
/usr/local/Acrobat5/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias camf="check-alt-mail-folders"
alias dfspace="dfspace -t ext3"
alias ftp=ncftp
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias play="/usr/lib/oss/bin/ossplay"
alias www='varcd www'
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"

# ---------------------------------------------------------------------------
# Development stuff

export mystuff=$HOME/src/mystuff
alias mystuff="varcd mystuff"

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

export ANT_HOME=/usr/local/java/ant
load_file ~/bash/java.sh
load_file ~/bash/fulltilt.sh

PATH=$PATH:/usr/lib/oss/sbin:/usr/lib/oss/bin # ADDED_BY_OSS
SDL_DSP_NOSELECT=1 # ADDED_BY_OSS
export PATH SDL_DSP_NOSELECT # ADDED_BY_OSS

# ---------------------------------------------------------------------------
# Local stuff

# Change public directory, then reload domain stuff

export public=/mnt/condor/pub
load_file ~/bash/$DOMAIN.sh
