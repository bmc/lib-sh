# $Id$

add_dir_contents_to_classpath()
{
    dir=$1
    shift
    p=$dir
    # Remaining args, if any, are exclusion patterns.
    for i in $dir/*
    do
        if [ -L $i ]
        then
            i=$(xreadlink $i)
        fi

        keep=1
        for excl_pattern in $*
        do
            # [[ with == does a pattern match
            if [[ $i == $excl_pattern ]]
            then
                keep=
                break
            fi
        done
        if [ -z "$keep" ]
        then
            continue
        fi

        p=$p:$i
    done
    CLASSPATH=$CLASSPATH:$dir:$p
}

if [ -z $JAVA_ROOT ]
then
    export JAVA_ROOT=$HOME/java
fi

if [ -z $ANT_HOME ]
then
    ANT_HOME=$JAVA_ROOT/ant
fi

export ANT_HOME
export ANT_ARGS="-logger org.apache.tools.ant.NoBannerLogger -emacs"

if [ -z $JAVA_HOME ]
then
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

export JAVAC="$JAVA_HOME/bin/javac"

if [ -n $JAVA_HOME ]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/i386:${LD_LIBRARY_PATH}

add_dir_contents_to_classpath $HOME/java/classes

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
        6|1.6|jdk6|jdk1.6*)
           _n=/usr/local/soylatte16
           ;;
        openjdk*)
           _n=/usr/local/openjdk6
           ;;
        apple6|apple-6|apple-jdk-6|apple1.6)
           _n=$JDK_ROOT/1.6.0/Home
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
    echo $JAVA_HOME
}

_java_sh=1
