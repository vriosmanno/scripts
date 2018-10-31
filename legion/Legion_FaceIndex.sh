#!/bin/bash
# Default Server
FACEINDEX_SERVER=10.0.0.41

if [ $1 != "" ]
    key="$1"
    
    case $key in
      l)
        FACEINDEX_SERVER=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
      ;;
      i)
        FACEINDEX_SERVER=$2
      ;;
    esac
    done
fi

echo "Setting FACE_RECOGNITION_SERVER to: $FACEINDEX_SERVER"
LEGION_ENV=$GOPATH/src/github.com/Novetta/legion/dev/legion.env
sed -i.bak '/FACE_RECOGNITION_URL/{$s/\(\([0-9]\{1,3\}\)\(\.\|\:\)\)\{1,4\}/'"$FACEINDEX_SERVER"':/}' $LEGION_ENV
