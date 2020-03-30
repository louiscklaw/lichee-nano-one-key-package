#!/usr/bin/env sh

timeout 2 wget -O- --post-data='{"text":"powersupply-pi httpd started"}'  --header='Content-type: application/json' 'https://hooks.slack.com/services/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'