# $Id: development.ksh,v 1.3 2001/02/10 17:13:59 bmc Exp $

export ft=$HOME/src/fulltilt
export ftsrc=$ft/com/fulltiltinc
export ftetc=$ft/etc
export iaccel=/usr/local/www/iaccel
export pps=$ft/pps
export ftpps=$pps

alias ftsrc='varcd ftsrc'
alias ft='varcd ft'
alias ftetc='varcd ftetc'
alias ftpps='varcd ftpps'
alias pps='varcd pps'
alias iaccel='varcd iaccel'

export FULLTILT_BUILD_ROOT=$ftsrc/build
export FULLTILT_CLASS_ROOT=$ft/classes
export FULLTILT_DOC_ROOT=$ft/iaccel-javadocs
export FULLTILT_USERDOC_ROOT=$ft/iaccel-userdocs
export FULLTILT_PLATFORM=unix.linux.2.2.x86
export FULLTILT_IACCEL_LIB=$ftclass
export JAVAC="$JAVA_HOME/bin/javac"
#export JAVAC="jikes +E"

# Force jikes to use the 1.2 JDK classes
#export JAVAC_EXTRA_FLAGS_ENV="-bootclasspath $JAVA_ROOT/jdk1.2.2/jre/lib/rt.jar"
export ftclass=$FULLTILT_CLASS_ROOT
alias ftclass='varcd ftclass'
export ftclasses=$ftclass
alias ftclasses='varcd ftclasses'

export JAVADOC_VERSION="1.2"
export JAVAC_EXTRA_FLAGS_ENV="-g"
export XMLC=xmlc

export CLASSPATH="${CLASSPATH}:${FULLTILT_CLASS_ROOT}:$FULLTILT_CLASS_ROOT/ibm:$FULLTILT_CLASS_ROOT/custom"

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
	export JAVAC_EXTRA_FLAGS_ENV="-bootclasspath $JAVA_HOME/jre/lib/rt.jar +Pno-shadow +Pno-switchcheck +Pno-serial -g -nowarn"
	;;
esac

#export CVSROOT=":ext:bclapper@iacceldev.fulltiltinc.com:/home/repository"
export CVSROOT=":pserver:bclapper@iacceldev.fulltiltinc.com:/home/repository"
#export CVS_RSH="ssh1"

if [[ -z $JAVA_ROOT ]]
then
    export JAVA_ROOT=/tmp
fi

# JDK_HOME is for IntelliJ IDEA
export JDK_HOME=$JAVA_HOME
export PATH=$PATH:$HOME/Idea/idea/bin

alias javac="$JAVAC"

function jdbc
{
    echo "Try 'sqlcmd' instead." >&2
    return 1
}

cleanpath JIKESPATH
