#!/bin/bash

# Restores nerdwiki back to correct MediaWiki paths
# NOTE: LocalSettings.php is not included in original backup script
# Run this script in nerdwiki folder

# TODO:
# - add prompt if original MediaWiki files already exist

rsync -av --progress --delete etc/mediawiki /etc/
rsync -av --progress --delete usr/share/mediawiki /usr/share/
rsync -av --progress --delete var/lib/mediawiki /var/lib/
