# ---------------------------------------------------------------------------
# Settings and overrides specific to host "darkroom"
#
# $Id: sunball.sh 6539 2006-11-02 14:45:36Z bmc $
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

# ---------------------------------------------------------------------------

export photos="/Volumes/CLAPPER-ORG;CONDOR-1"
export PERL5LIB=$HOME/lib/perl

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=$HOME/java
export ANT_HOME=$JAVA_ROOT/ant
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

eval `classpath -k -J`

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$JAVA_HOME/bin:\
$HOME/bin:\
$PATH:\
/sw/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias blog='varcd blog'
alias camf="check-alt-mail-folders"
#alias dfspace="dfspace -t ext3 -t ext2"
alias ftp=ncftp
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"

# Only necessary if using OSS drivers. FC6 sound drivers seem to work.
#alias play="/usr/lib/oss/bin/ossplay"
alias www='varcd www'
alias xinit="/usr/bin/xinit -- -bpp 16"

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

export public=/Volumes/CLAPPER-ORG';'CONDOR-1
load_file ~/bash/$DOMAIN.sh

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
