#!/bin/bash
FACEINDEX_ENV=/opt/faceindex/conf/faceindex.env
 
echo "Installing faceindex to local vm"
sudo yum install -y faceindex
/opt/faceindex/setup/updateDb.sh
 
if grep -qF "PYTHONPATH" $FACEINDEX_ENV; then
    echo "PYTHONPATH exists in faceindex.env"
    echo "Updating variable"
    sudo sed -i.bak '/PYTHONPATH/{$s/=.*/=\/opt\/faceindex\/lib_cpu\/python2.7\/site-packages:$PYTHONPATH/}' $FACEINDEX_ENV
else
    echo "PYTHONPATH did not exist in faceindex.env"
    exho "Adding variable"
    echo 'export PYTHONPATH=/opt/faceindex/lib_cpu/python2.7/site-packages:$PYTHONPATH' | sudo tee -a $FACEINDEX_ENV
fi
 
echo "Complete"
