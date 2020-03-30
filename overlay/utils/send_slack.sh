#!/usr/bin/env sh

set -xe

# # timeout 3 wget -O- --post-data='{"text":"helloworld from powersupply-pi!"}'  --header='Content-type: application/json' 'https://hooks.slack.com/services/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'
# # SLACK_WEB_HOOK=https://hooks.slack.com/services/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

# # timeout 3 wget -O- --post-data='{"text":"helloworld from powersupply-pi!"}'  --header='Content-type: application/json' 'http://httpbin.org/post'

# echo {\"text\": \"$1\"} > /tmp/temp.json

# wget -q -O - --header="Content-Type:application/json" --post-file=/tmp/temp.json $SLACK_WEB_HOOK

# # rm -rf index.*
# rm -rf wget-log*
# rm -rf /tmp/temp.json


timeout 2 wget -O- --post-data='{"text":"helloworld from powersupply-pi!"}'  --header='Content-type: application/json' 'https://hooks.slack.com/services/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'