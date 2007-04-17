# ---------------------------------------------------------------------------
# Settings and overrides specific to host "darkroom"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

# ---------------------------------------------------------------------------

usr_local_site="/mnt/condor/site"
photos=$usr_local_site/public/photos
export public=$usr_local_site/public
export PERL5LIB=$HOME/lib/perl
export NETHACKOPTIONS='pickup_types=$!?=/,gender=male,fruit=kiwi'

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=$HOME/java
export ANT_HOME=$JAVA_ROOT/ant
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export JAVA_HOME=/Library/Java/Home

eval `classpath -k -J`

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$JAVA_HOME/bin:\
$HOME/bin:\
/usr/X11R6/bin:\
$PATH:\
$photos

# ---------------------------------------------------------------------------
# Aliases and functions

alias blog='varcd blog'
alias camf="check-alt-mail-folders"
#alias dfspace="dfspace -t ext3 -t ext2"
alias ftp=ncftp
alias nslookup="$(type -P nslookup) -silent"
alias www='varcd www'
alias xine="/Applications/XinePlayer.app/Contents/MacOS/XinePlayer"
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
# Local stuff

# Change public directory, then reload domain stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
