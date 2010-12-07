
export nodosfilewarning=1
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

unset -f mkprompt
mkprompt()
{
    PS1='\[\e[1m\](\h:\u) \W $ \[\e[m\]'
}

export DISPLAY=127.0.0.1:0.0
export SCALA_HOME=c:\\scala
export JAVA_HOME="D:\\Java\\JDK6"
export FHOME=/cygdrive/f/home/bclapper
export HOME="/cygdrive/c/Documents and Settings/bclapper"
export dev="$HOME/development"
export idw="$dev/code/idw"

pathinsert "$HOME/emacs-22.3/bin"
pathinsert "$HOME/python/bin"
pathinsert "$HOME/bin"

alias d='ls -CF --color'
alias fhome='varcd FHOME'
alias dev='varcd dev'
alias idw='varcd idw'
