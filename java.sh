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

_java_sh=1
