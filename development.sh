# $Id$

export ft=/usr/local/fulltilt
export ftsrc=$ft/com/fulltiltinc
export ftetc=$ft/etc

alias ftsrc='varcd ftsrc'
alias ft='varcd ft'
alias ftetc='varcd ftetc'
alias ftclass='varcd ftclass'

# new
export FULLTILT_BUILD_ROOT=$ftsrc/build
export FULLTILT_CLASS_ROOT=$ft/classes
export FULLTILT_DOC_ROOT=$ft/javadocs
export FULLTILT_PLATFORM=unix.freebsd.4.3.x86
#export JAVAC="$JAVA_HOME/bin/javac"
export JAVAC="jikes +E"

# Shujit has some problems. rssget will cause it to dump. Using OpenJIT for now.
#export JAVA_COMPILER=shujit
export JAVA_COMPILER_OPT=quiet
export JAVA_COMPILER=OpenJIT
export JAR=fastjar

export ftclass=$FULLTILT_CLASS_ROOT

# Force jikes to use the 1.2 JDK classes
#export JAVAC_EXTRA_FLAGS_ENV="-bootclasspath $JAVA_ROOT/jdk1.2.2-sun/jre/lib/rt.jar"

export JAVADOC_VERSION="1.2"
export JAVAC_EXTRA_FLAGS="-g"
export LD_LIBRARY_PATH=$JAVA_HOME/lib/i386:${LD_LIBRARY_PATH}
export XMLC=xmlc

export CLASSPATH="${CLASSPATH}:$FULLTILT_CLASS_ROOT"

# For Jikes: Must also include path to JDK's classes, so Jikes knows what
# JDK its compiling against. Setting EXTDIRS tells Jikes where to find the
# Java extensions, since it's not part of the JDK.

case "$JAVAC" in
    jikes*)
	CLASSPATH="$JAVA_HOME/jre/lib/rt.jar:$CLASSPATH"
	export EXTDIRS=$JAVA_HOME/jre/lib/ext
	;;
esac


if [[ -z $JAVA_ROOT ]]
then
    export JAVA_ROOT=/tmp
fi

export ANT_HOME=$JAVA_ROOT/ant
export ANT_ARGS="-logger org.apache.tools.ant.NoBannerLogger -emacs"

export PATH=$PATH:$JAVA_ROOT/enhydra/bin:$ANT_HOME/bin

alias javac="$JAVAC"
alias jar="$JAR"

export JAVA_ROOT=/usr/local/java

if [ -z $JAVA_HOME ]
then
    export JAVA_HOME=$JAVA_ROOT/jdk1.3.1
fi
export ANT_HOME=/usr/local/java/ant

if [[ -n $JAVA_HOME ]]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

eval `classpath -k -J`

PATH=\
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
