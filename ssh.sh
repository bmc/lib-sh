SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_ssh_agent
{
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV
    echo succeeded
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
}

# test for identities
function test_ssh_identities
{
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_ssh_agent
        fi
    fi
}

case "$PLATFORM" in
    darwin|*bsd)
        ps='ps -agux'
        ;;
    solaris|linux)
        ps='ps -ef'
        ;;
    *)
        echo "Don't know how to run ps(1) on this $PLATFORM system."
        ps=
        ;;
esac

if [ -n "$ps" ]
then
    # check for running ssh-agent with proper $SSH_AGENT_PID
    $ps | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]
    then
        test_ssh_identities

# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
    else
        . $SSH_ENV > /dev/null
        ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
        if [ $? -eq 0 ]
        then
            test_ssh_identities
        else
            start_ssh_agent
        fi
    fi
fi
