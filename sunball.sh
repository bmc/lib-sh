# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=/usr/local/lib/perl
export www=/usr/local/www/apache
export APACHE_HOME=$www
export TOMCAT_HOME=$APACHE_HOME/tomcat

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
$ANT_HOME/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias camf="check-alt-mail-folders"
alias dfspace="dfspace -t ext3"
alias ftp=ncftp
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
#alias play="/usr/lib/oss/play"
alias www='varcd www'
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"

# ---------------------------------------------------------------------------
# Development stuff

export mystuff=$HOME/src/my-stuff/working
alias mystuff="varcd mystuff"

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

#load_file ~/bash/development.sh
