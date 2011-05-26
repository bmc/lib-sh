SCALA_LOCATIONS="$HOME/scala /usr/local/scala"
SCALA_DEFAULT=2.9.0

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
            ver=$SCALA_DEFAULT
            ;;
        1)
            ver=$1
            ;;
        *)
            echo "Usage: switch-scala version|show" >&2
            return 1
            ;;
    esac

    _scala=$(find_scala)

    if [ -z $_scala ]
    then
        return 1
    fi

    case "$ver" in
        show)
            _n=
            ;;
        default)
            _n=$_scala/scala-$SCALA_DEFAULT
            ;;
        2.7|2.7.?)
           _n=$_scala/scala-2.7.7
           ;;
        2.8|2.8.?|2.8.*)
           _n=$_scala/scala-2.8.1
           ;;
        2.9|2.9.0)
           _n=$_scala/scala-2.9.0
           ;;
        *)
           ;;
    esac

    if [ -n "$_n" ]
    then
        if [ ! -d $_n ]
        then
            echo "No such Scala version -- $ver ($_n)" >&2
            return 1
        fi

        if [ -n "$SCALA_HOME" ]
        then
	    rmpath PATH $SCALA_HOME/bin
        fi
    fi

    export SCALA_HOME=$_n
    PATH=$SCALA_HOME/bin:$PATH
    if interactive
    then
        echo $SCALA_HOME
    fi
}

alias set-scala=switch-scala
alias use-scala=switch-scala
switch-scala default
