#!/bin/bash

# Copies MediaWiki files to nerdwiki project folder.

rsync -av --progress --delete --exclude LocalSettings.php /etc/mediawiki ~/proj/nerdwiki/etc/
rsync -av --progress --delete /usr/share/mediawiki ~/proj/nerdwiki/usr/share/
rsync -av --progress --delete /var/lib/mediawiki ~/proj/nerdwiki/var/lib/
