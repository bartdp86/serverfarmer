#!/bin/bash
# Konfiguracja zaufanych źródeł pakietów z oprogramowaniem

. /opt/farm/scripts/init
. /opt/farm/scripts/functions.install



# TODO: support for rpm

if [ -f $base/listchanges.conf ]; then
	install_link $base/listchanges.conf /etc/apt/listchanges.conf
fi

if [ -f $base/sources.list ]; then
	dst="/etc/apt/sources.list"
	oldmd5=`md5sum $dst`
	install_link $base/sources.list $dst
	newmd5=`md5sum $dst`

	if [ "$oldmd5" != "$newmd5" ]; then
		apt-get update
	fi
fi
