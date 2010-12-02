
alias vi=vim

pathinsert()
{
    for i in "$@"
    do
        export PATH="$i:$PATH"
    done
}

pathappend()
{
    for i in "$@"
    do
        export PATH="$PATH:$i"
    done
}

export DISPLAY=127.0.0.1:0.0
export SCALA_HOME=c:\\scala
export JAVA_HOME="D:\\Java\\JDK6"
export FHOME=/cygdrive/f/home/bclapper
export HOME="/cygdrive/c/Documents and Settings/bclapper"

pathinsert "$HOME/python/bin"
pathappend $HOME/emacs-22.3/bin
pathinsert $JAVA_HOME\\bin
pathappend $SCALA_HOME\\bin
pathappend c:\\java\\apache-ant-1.7.1\\bin
pathinsert $HOME/bin

alias d='ls -CF --color'
alias fhome='varcd FHOME'

# Java

wd=$(pwd)
cd $HOME/java/classes
CLASSPATH=.
for i in *
do
    CLASSPATH="$CLASSPATH;c:\\$HOMEPATH\\java\\classes\\$i"
done
export CLASSPATH
cd $wd
unset wd
