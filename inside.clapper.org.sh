# $Id$

export FTP_PASSIVE_MODE=on
export FTP_PASSIVE=true		# for perl
export CVSEDITOR=`type -P vi`

export PERL5LIB="/usr/local/lib/perl:/usr/local/site/lib/perl:$HOME/lib/perl"
cleanpath PERL5LIB

export PATH=/usr/local/site/bin:$PATH

export public=/usr/local/site/public
alias public="varcd public"

export photos=$public/photos
alias photos="varcd photos"
alias new-photo-dir=$photos/new-photo-dir

export mystuff=/usr/local/src/my-stuff/working
alias mystuff="varcd mystuff"

export wsrc="$mystuff"
alias wsrc='varcd wsrc'

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

alias camf=check-alt-mail-folders

