# Amazon Web Services-related stuff. ZSH-specific.

# The AWS command line tools are installed via pip(1), and they come with
# an aws_zsh_completer.sh to set up command line completion for ZSH. The
# shell file ends up in the Python bin directory. Test for it, and source it
# if it exists.

_python_bin=$(dirname $(whence -p python))
_aws=$_python_bin/aws_zsh_completer.sh
if [ -f $_aws ]
then
    echo "Loading $_aws"
    source $_aws
fi
unset _python_bin _aws

