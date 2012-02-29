: ${python_version:=2.7.1}

if [ -d $HOME/python ]
then
    export PATH=$HOME/python/bin:$PATH
else
    pythonbrew use $python_version >/dev/null 2>&1
    pybin=$(whence python)
    if [ $? -eq 0 ]
    then
        dir=$(pwd)
        cd $(dirname $pybin)/../lib/python2.*
	export PYTHONPATH=$(pwd):$PYTHONPATH
	cd $dir
    fi
fi

