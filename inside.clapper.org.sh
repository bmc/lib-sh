# $Id$

export FTP_PASSIVE_MODE=on
export FTP_PASSIVE=true		# for perl
export CVSEDITOR=`type -P vi`

export PERL5LIB="/usr/local/lib/perl:/usr/local/site/lib/perl:$HOME/lib/perl"
cleanpath PERL5LIB

export PATH=/usr/local/site/bin:$PATH
export public=/usr/local/site/public
export photos=$public/photos

alias camf=check-alt-mail-folders
alias photos="varcd photos"
alias public="varcd public"
