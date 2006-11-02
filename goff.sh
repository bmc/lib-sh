# ---------------------------------------------------------------------------
# Settings and overrides specific to host "goff"
# ---------------------------------------------------------------------------
export DISPLAY=goff:0.0
export CVSROOT=pserver:bclapper@10.0.1.24:/home/repository
export CLASSPATH=""
export JAVA_HOME="/cygdrive/d/jdk1.5.0_04"

sep=

cd $HOME/java/classes
for i in *.jar
do
    CLASSPATH="$CLASSPATH${sep}d:\\home\\bmc\\java\\classes\\$i"
    sep=";"
done

export PATH=\
$JAVA_HOME/bin:\
$PATH:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/X11R6/bin:\
/cygdrive/c/Borland/BCC55/Bin

# Local aliases

alias ftp=ncftp3
#alias login-from="loginfrom $(tty)"
alias vi=vim

cd ~
