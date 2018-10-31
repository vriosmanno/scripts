#!/bin/bash
DIGEST_REALM=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
LEGION_ENV=$GOPATH/src/github.com/Novetta/legion/dev/legion.env
sed -i.bak '/FACE_RECOGNITION_URL/{$s/\(\([0-9]\{1,3\}\)\(\.\|\:\)\)\{1,4\}/'"$DIGEST_REALM"':/}' $LEGION_ENV
