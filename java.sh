# $Id$

export JAVA_ROOT=/usr/local/java

#export JAVAC="$JAVA_HOME/bin/javac"
export JAVAC="jikes +E"

# Shujit has some problems. rssget will cause it to dump. Using OpenJIT for now.
#export JAVA_COMPILER=shujit
#export JAVA_COMPILER_OPT=quiet
#export JAVA_COMPILER=OpenJIT

export LD_LIBRARY_PATH=$JAVA_HOME/lib/i386:${LD_LIBRARY_PATH}

if [ -z $ANT_HOME ]
then
    ANT_HOME=/usr/local/ant
fi
export ANT_HOME
export ANT_ARGS="-logger org.apache.tools.ant.NoBannerLogger -emacs"

if [ -z $JAVA_HOME ]
then
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

if [ -n $JAVA_HOME ]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

JAR=$(type -p fastjar)
if [ -z $JAR ]
then
    JAR=$JAVA_HOME/bin/jar
fi
export JAR

alias javac="$JAVAC"
alias jar="$JAR"

# Note: Some FreeBSD packages also load a "classpath" executable in
# /usr/local/bin.
eval `classpath -k -J`

export PATH=\
$PATH:\
$JAVA_HOME/bin:\
$ANT_HOME/bin:\
$JAVA_ROOT/jython:\
$JAVA_ROOT/javacc-3.0/bin:

case "$JAVAC" in
    jikes*)
	CLASSPATH="$JAVA_HOME/jre/lib/rt.jar:$CLASSPATH"

	# For Jikes: Must also include path to JDK's classes, so Jikes knows
	# what JDK its compiling against. Setting EXTDIRS tells Jikes where to
	# find the Java extensions, since it's not part of the JDK.

	#export JIKESPATH=$JAVA_HOME/jre/lib/rt.jar:$CLASSPATH
	export EXTDIRS=$JAVA_HOME/jre/lib/ext
	;;
esac

cleanpath JIKESPATH

_java_sh=1
