SCALA_LOCATIONS="$HOME/scala /usr/local/scala"
function find_scala
{
    _scala=
    for d in $HOME/scala /usr/local/scala
    do
        if [ -d $d -o -s $d ]
        then
            _scala=$d
            break
        fi
    done

    if [ -z $_scala ]
    then
        echo "Did not find one of: $HOME/scala /usr/local/scala" >&2
        return 1
    fi

    echo $_scala
    return 0
}

function switch-scala
{
    case $# in
        0)
            echo $SCALA_HOME
            return
            ;;
        1)
            ;;
        *)
            echo "Usage: switch-scala scala" >&2
            return 1
            ;;
    esac

    _scala=$(find_scala)
    if [ -z $_scala ]
    then
        return 1
    fi

    case "$1" in
        2.7|2.7.?)
           _n=$HOME/scala/scala-2.7.7
           ;;
        2.8|2.8.?|2.8.*|default)
           _n=$HOME/scala/scala-2.8.1
           ;;
        2.9|2.9.0)
           _n=$HOME/scala/scala-2.9.0
           ;;
        *)
           ;;
    esac

    if [ ! -d $_n ]
    then
        echo "No such Scala version -- $1 ($_n)" >&2
        return 1
    fi

    export PATH=$(echo $PATH | sed "s+$SCALA_HOME/bin:++g")
    if [ -n "$SCALA_HOME" ]
    then
	rmpath PATH $SCALA_HOME/bin
    fi
    export SCALA_HOME=$_n
    PATH=$SCALA_HOME/bin:$PATH
    echo $SCALA_HOME
}

alias set-scala=switch-scala
switch-scala default
