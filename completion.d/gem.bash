#!/bin/bash
#
# Bash completions for Ruby "gem" command.

GEM_COMMANDS="\
build \
cert \
check \
cleanup \
contents \
dependency \
environment \
fetch \
generate_index \
help \
install \
list \
lock \
man \
outdated \
owner \
pristine \
push \
query \
rdoc \
search \
server \
sources \
specification \
stale \
uninstall \
unpack \
update \
which"
HELP_COMMANDS="commands examples platforms $GEM_COMMANDS"

_gem()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [ $COMP_CWORD == 1 ]
    then
      COMPREPLY=($(compgen -W "${GEM_COMMANDS}" -- ${cur}))
      return 0
    fi

    if [ $COMP_CWORD == 2 ]
    then
        case "$prev" in
            "help")
              COMPREPLY=($(compgen -W "${HELP_COMMANDS}" -- ${cur}))
              return 0
              ;;
            *)
              ;;
        esac
    fi
}

complete -F _gem gem
