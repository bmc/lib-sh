# $Id$

export FTP_PASSIVE_MODE=on
export FTP_PASSIVE=true		# for perl
export CVSEDITOR=`type -P vi`

export PERL5LIB="/usr/local/lib/perl:/usr/local/site/lib/perl:$HOME/lib/perl"
cleanpath PERL5LIB

export PATH=/usr/local/site/bin:$PATH

alias camf=check-alt-mail-folders
alias photos="cd /usr/local/site/public/photos"
