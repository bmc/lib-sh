# ---------------------------------------------------------------------------
# Settings and overrides specific to host "darkroom"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

# ---------------------------------------------------------------------------

photos=$usr_local_site/public/photos
export public=$usr_local_site/public
mnt=$HOME/mnt
usr_local_site="$mnt/condor-site"
export condor_home=$mnt/condor-home
export PERL5LIB=$HOME/lib/perl
export www=$HOME/Sites
export FORTUNE_FILE=$HOME/lib/games/fortunes
export JYTHON_HOME=/home/bmc/java/jython/jython/dist
export SCALA_HOME=/usr/local/scala/scala

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

export JDK_ROOT=/System/Library/Frameworks/JavaVM.framework/Versions
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home
export JAVA_HOME=/usr/local/soylatte16

eval `classpath -k -J`
function switch-jdk
{
    case $# in
        0)
            echo $JAVA_HOME
            ;;
        1)
            ;;
        *)
            echo "Usage: switch-jdk jdk" >&2
            return 1
            ;;
    esac

    case "$1" in
        6|1.6|jdk6|jdk1.6*)
           _n=/usr/local/soylatte16
           ;;
        5|1.5|jdk5|jdk1.5*)
           _n=$JDK_ROOT/1.5.0/Home
           ;;
        4|1.4|1.4.2|jdk4|jdk1.4*)
           _n=$JDK_ROOT/1.4.2/Home
           ;;
        3|1.3|jdk3|jdk1.3*)
           _n=$JDK_ROOT/1.3/Home
           ;;
        *)
           ;;
    esac

    if [ ! -d $_n ]
    then
        echo "No such JDK -- $1 ($_n)" >&2
        return 1
    fi

    export PATH=$(echo $PATH | sed "s+$JAVA_HOME/bin:++g")
    if [ -n "$JAVA_HOME" ]
    then
	rmpath PATH $JAVA_HOME/bin
    fi
    export JAVA_HOME=$_n
    PATH=$JAVA_HOME/bin:$PATH
}

alias set-jdk=switch-jdk

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$HOME/python/bin:\
$JAVA_HOME/bin:\
$HOME/bin:\
/usr/X11R6/bin:\
/usr/local/mysql/bin:\
/opt/local/lib/postgresql83/bin:\
$PATH:\
$photos:\
$JYTHON_HOME/bin:\
$SCALA_HOME/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias blog='varcd blog'
alias camf="check-alt-mail-folders"
alias condor-home='varcd condor_home'
alias condor_home='varcd condor_home'
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

export mypy=$mystuff/python
alias mypy='varcd mypy'

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

export etsrc=$jsrc/expense-time
alias etsrc='varcd etsrc'

export ANT_HOME=$JAVA_ROOT/ant
export MAVEN_HOME=$JAVA_ROOT/maven
export GROOVY_HOME=$JAVA_ROOT/groovy

PATH=\
$PATH:\
$ANT_HOME/bin:\
$MAVEN_HOME/bin:\
$GROOVY_HOME/bin:\
$HOME/Eclipse/eclipse:\
$HOME/python/bin

load_file ~/bash/java.sh
load_file ~/bash/fulltilt.sh

# ---------------------------------------------------------------------------
# Local stuff

# Change public directory, then reload domain stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/opt/local/lib
