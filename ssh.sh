# See http://help.github.com/working-with-key-passphrases/

SSH_ENV="$HOME/.ssh/environment"
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"

function ssh_agent
{
    if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]
    then
        eval `$SSHAGENT $SSHAGENTARGS`
        trap "kill $SSH_AGENT_PID" 0
        ssh-add -D
        echo "Adding SSH identity."
        ssh-add
    fi
}

alias ssha=ssh_agent
