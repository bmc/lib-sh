# $Id$

export JAVA_ROOT=/usr/local/java

export JAVAC="$JAVA_HOME/bin/javac"
#export JAVAC="jikes +E"

# Shujit has some problems. rssget will cause it to dump. Using OpenJIT for now.
#export JAVA_COMPILER=shujit
#export JAVA_COMPILER_OPT=quiet
#export JAVA_COMPILER=OpenJIT

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

export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/i386:${LD_LIBRARY_PATH}

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

case "$PLATFORM" in
    freebsd)
	# Use the javavmwrapper, instead of the native JDK java
	PATH=$PATH:/usr/local/bin
	;;
esac

export PATH=\
$PATH:\
$JAVA_HOME/bin:\
$ANT_HOME/bin:\
$JAVA_ROOT/jython:\
$JAVA_ROOT/javacc-3.0/bin:

# IntelliJ Idea
export IDEA_JDK=/usr/local/java/jdk1.5.0
export PATH=$PATH:$HOME/Idea/idea/bin

case "$JAVAC" in
    jikes*)
	# For Jikes: Must also include path to JDK's classes, so Jikes knows
	# what JDK its compiling against. Setting EXTDIRS tells Jikes where to
	# find the Java extensions, since it's not part of the JDK.

	# WARNING: Putting rt.jar in the classpath screws things up royally
	# on JDK 1.4, because that JDK ships with a version of the org.w3c
	# interfaces that is incompatible with the version in XMLC. Leave
	# rt.jar out of CLASSPATH, and make sure it's in -bootclasspath,
	# and all seems to be well.

        java_version=`java -version 2>&1 | sed -e 's/"//g' -e 's/^java version //' -e 1q`
        case "$java_version" in
	    1.4*)
	        JIKESPATH=
		sep=
		for i in jce.jar jsse.jar
		  do
		  if [ -f $JAVA_HOME/jre/lib/$i ]
		      then
		      JIKESPATH="$JIKESPATH$sep$JAVA_HOME/jre/lib/$i"
		      sep=:
		  fi
		done
		unset sep
		JIKESPATH=$CLASSPATH:$JIKESPATH
		export JIKESPATH
		export CLASSPATH=$JIKESPATH
                export EXTDIRS=$JAVA_HOME/jre/lib/ext
		;;
	    1.3*)
	        export JIKESPATH=$JAVA_HOME/jre/lib/rt.jar:$CLASSPATH
		export CLASSPATH=$JIKESPATH
                export EXTDIRS=$JAVA_HOME/jre/lib/ext
		;;
	esac

	# the following seems to be necessary for jikes
	export JAVAC_EXTRA_FLAGS_ENV="-bootclasspath $JAVA_HOME/jre/lib/rt.jar +Pno-shadow +Pno-switchcheck +Pno-serial"
	;;
esac

cleanpath JIKESPATH

_java_sh=1
