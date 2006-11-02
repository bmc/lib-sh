# $Id$

export FTP_PASSIVE_MODE=on
export FTP_PASSIVE=true		# for perl
export CVSEDITOR=`type -P vi`

if [ -z $PERL5LIB ]
then
    PERL5LIB="/usr/local/lib/perl:/usr/local/site/lib/perl"
fi
PERL5LIB=${PERL5LIB}:$HOME/lib/perl
export PERL5LIB
cleanpath PERL5LIB

export PATH=/usr/local/site/bin:$PATH

if [ -z $public ]
then
    public=/usr/local/site/public
fi
export public
alias public="varcd public"

export photos=$public/photos
alias photos="varcd photos"

if [ -z $mystuff ]
then
    mystuff=/usr/local/src/my-stuff/working
fi
export mystuff
alias mystuff="varcd mystuff"

export wsrc="$mystuff"
alias wsrc='varcd wsrc'

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

alias camf=check-alt-mail-folders

