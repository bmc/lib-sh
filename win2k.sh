# Force GNU make to behave like Unix

#export MAKE=unix

alias gmake=make
alias ls='ls --color=tty -CF'

case "$TERM" in
    xterm*)
        # Avoid annoying two-screen (screen-switching) effect. Use vt100
        # instead.
        term vt100
        ;;
esac
