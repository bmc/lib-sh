# Additional Ruby-related stuff.

# Push the current rvm settings and switch to another rvm. Requires 'stack.sh'

stack_new rvm_stack
function rvm_push
{
    : ${1?'missing new rvm'}
    cur=$(rvm current)
    stack_push rvm_stack $cur
    rvm $1
    rvm current
}

function rvm_pop
{
    stack_size rvm_stack i
    if (( $? == 0 ))
    then
        if (( $i == 0 ))
        then
            echo "RVM stack is empty." >&1
            return 1
        fi
        stack_pop rvm_stack prev
        rvm $prev
        rvm current
    fi
}


