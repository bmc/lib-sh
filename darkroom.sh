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

# According to
# http://adcdownload.apple.com/Java/java_se_6.0_release_1_developer_preview_6/javase6r1dp6releasenotes.html#Switchable_Command_Line_Tools
#
# "Developers should not rely on the existence or behavior of the User
# Switchable Java Command Line Tools, as they are, by definition, under the
# control of the user. If it is necessary for an application to use a
# specific version of Java, the application developer should take
# appropriate steps to not rely on /usr/bin/java, but rather should use
# explicit paths into
# /System/Library/Frameworks/JavaVM.framework/Versions/1.x/Commands for
# shell script based invocations of Java tools."

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
#export JAVA_HOME=/Library/Java/Home

eval `classpath -k -J`

# ---------------------------------------------------------------------------
# PATH

# On Darwin, use /usr/bin/java, not what's in JAVA_HOME.

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
