# $Id$

# Make sure java.sh is loaded first.

if [ -z $_java_sh ]
then
    load_file $HOME/bash/java.sh
fi

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
export FULLTILT_PLATFORM=unix.$PLATFORM.4.3.x86

export ftclass=$FULLTILT_CLASS_ROOT

export JAVADOC_VERSION="1.2"
export JAVAC_EXTRA_FLAGS="-g"
export XMLC=xmlc

export CLASSPATH="${CLASSPATH}:$FULLTILT_CLASS_ROOT"
