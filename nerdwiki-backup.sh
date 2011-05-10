#!/bin/bash

# Copies MediaWiki files to nerdwiki project folder.

rsync -av --progress --delete --exclude LocalSettings.php /etc/mediawiki ~/projects/nerdwiki/etc/
rsync -av --progress --delete /usr/share/mediawiki ~/projects/nerdwiki/usr/share/
rsync -av --progress --delete /var/lib/mediawiki ~/projects/nerdwiki/var/lib/
