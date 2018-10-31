#!/bin/bash
# Default Server
FACEINDEX_SERVER=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
echo "Setting FACE_RECOGNITION_SERVER to: $FACEINDEX_SERVER"
LEGION_ENV=$GOPATH/src/github.com/Novetta/legion/dev/legion.env
sed -i.bak '/FACE_RECOGNITION_URL/{$s/\(\([0-9]\{1,3\}\)\(\.\|\:\)\)\{1,4\}/'"$FACEINDEX_SERVER"':/}' "$LEGION_ENV"
cat LEGION_ENV | grep FACE_RECOGNITION
