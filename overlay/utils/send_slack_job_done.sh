#!/usr/bin/env sh

timeout 2 wget -O- --post-data='{"text":"powersupply-pijob done!"}'  --header='Content-type: application/json' 'https://hooks.slack.com/services/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'