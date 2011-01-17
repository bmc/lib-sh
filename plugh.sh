# ---------------------------------------------------------------------------
# Environment variables

export TERM=xterm1
. ~/bash/ssh.sh
export DFSPACE_OPTS="-t rootfs -t vfat"

# ---------------------------------------------------------------------------
# Aliases

alias top=htop
alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/messages"

# ---------------------------------------------------------------------------
# Startup stuff

ssha
