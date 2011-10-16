# ---------------------------------------------------------------------------
# Settings and overrides specific to host "darkroom"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

# ---------------------------------------------------------------------------

mnt=$HOME/mnt
usr_local_site="$mnt/condor-site"
export condor_home=$mnt/condor-home
export www=$HOME/Sites
export FORTUNE_FILE=$HOME/src/mystuff/fortunes/fortunes
export SCALA_HOME=/usr/local/scala/scala

# Use xterm1, which avoids the alternate screen buffer. (See /etc/termcap)

case "$TERM" in
    xterm*)
        TERM=xterm1
        #export TERM=xterm
	;;
esac

export PATH=\
$HOME/.cabal/bin:\
$HOME/Library/Haskell/bin:\
$HOME/bin:\
$PATH:\
$SCALA_HOME/bin:\

# ---------------------------------------------------------------------------
# Node.js, et al

export NODE_PATH=/usr/local/lib/node

PATH=${PATH}:/usr/local/lib/node_modules/coffee-script/bin

# ---------------------------------------------------------------------------
# Python

pythonbrew use 2.7.1 >/dev/null 2>&1

# ---------------------------------------------------------------------------
# Ruby

export GEM_HOME=$HOME/.gem/ruby/1.9
PATH=$PATH:$HOME/.gem/ruby/1.9/bin:

rvm 1.9.2@ardentex
if interactive
then
    echo "Using Ruby $(rvm current)"
fi

alias man='gem man -s'

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=$HOME/java
export ASM_HOME=$JAVA_ROOT/asm-3.2

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
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

eval `classpath -k -J`

load_file ~/bash/java.sh
load_file ~/bash/scala.sh

growl()
{
    echo -e $'\e]9;'${1}'\007'
    return
}

function switch-jdk
{
    case $# in
        0)
            echo $JAVA_HOME
            return
            ;;
        1)
            ;;
        *)
            echo "Usage: switch-jdk jdk" >&2
            return 1
            ;;
    esac

    case "$1" in
        soy|soy6|soylatte|soylatte6|soylatte16)
            _n=/usr/local/soylatte16
            ;;
        openjdk*)
            _n=/usr/local/openjdk6
            ;;
        apple6|apple-6|apple-jdk-6|apple1.6|6|1.6|jdk6|jdk1.6*|default)
            _n=$JDK_ROOT/1.6.0/Home
            ;;
        5|1.5|jdk5|jdk1.5*)
            _n=$JDK_ROOT/1.5.0/Home
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
    echo $JAVA_HOME
}

alias set-jdk=switch-jdk
alias setjdk=switch-jdk
alias setjava=switch-jdk
alias set-java=switch-jdk

# ---------------------------------------------------------------------------
# Aliases and functions

alias ftp=ncftp
alias top=htop
alias www='varcd www'

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
$HOME/jython/bin:\
$MAVEN_HOME/bin:\
$HOME/python/bin:\
$ANT_HOME/bin:\
/usr/local/texlive/2010/bin/universal-darwin

# ---------------------------------------------------------------------------
# Hozzle Rocket

export RAILS_ENV=briandev
export RAILS_GEM_VERSION=2.3.11

export boom=$HOME/src/consulting/hozzle-rocket/boomerangmail
alias boom="varcd boom"

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=/usr/local/lib:$HOME/lib:${LD_LIBRARY_PATH}

# Not necessary on Mac OS X; Mac OS X starts an integrated one.
#load_file ~/bash/ssh.sh

# ---------------------------------------------------------------------------
# Android

export ANDROID_SDK=$HOME/Android/android-sdk-mac_86
PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools
