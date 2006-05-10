# $Id: bclapper.fulltilt.com.sh,v 1.1 2003/07/09 14:35:31 bmc Exp $

export FTP_PASSIVE_MODE=on
export FTP_PASSIVE=true		# for perl
export CVSEDITOR=`type -P vi`

alias sdrive="smbclient //ftmaster/share -U bclapper -I ftmaster.fulltilt.com"
