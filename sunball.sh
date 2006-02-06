# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=/usr/local/lib/perl
export www=/usr/local/www
export blog="/mnt/condor/usr/local/site/chroot/apache/usr/local/apache2/htdocs/bmc/blog"
export APACHE_HOME=$www
export TOMCAT_HOME=$APACHE_HOME/tomcat
export CVSROOT=":pserver:bmc@condor.inside.clapper.org:/usr/local/src/my-stuff/CVS-tree"

# For OSS sound driver.
export PATH=$PATH:/usr/lib/oss/bin
export SDL_DSP_NOSELECT=1

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
/usr/local/Acrobat5/bin:\
/opt/cxoffice/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias blog='varcd blog'
alias camf="check-alt-mail-folders"
alias dfspace="dfspace -t ext3"
alias ftp=ncftp
alias gv="kghostview"
alias ghostview="kghostview"
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

export ANT_HOME=$JAVA_ROOT/ant
export MAVEN_HOME=$JAVA_ROOT/maven
export GROOVY_HOME=$JAVA_ROOT/groovy

PATH=\
$PATH:\
$ANT_HOME/bin:\
$MAVEN_HOME/bin:\
$GROOVY_HOME/bin:\
$HOME/Eclipse/eclipse

load_file ~/bash/java.sh
load_file ~/bash/fulltilt.sh

# ---------------------------------------------------------------------------
# OSS

PATH=$PATH:/usr/lib/oss/sbin:/usr/lib/oss/bin # ADDED_BY_OSS
SDL_DSP_NOSELECT=1 # ADDED_BY_OSS
export PATH SDL_DSP_NOSELECT # ADDED_BY_OSS

# ---------------------------------------------------------------------------
# Local stuff

# Change public directory, then reload domain stuff

export usr_local_site=/mnt/condor/usr/local/site
export public=${usr_local_site}/public
load_file ~/bash/$DOMAIN.sh

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
