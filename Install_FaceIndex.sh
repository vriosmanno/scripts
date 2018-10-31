#!/bin/bash
# This sets up FaceIndex locally on your VM
FACEINDEX_ENV=/opt/faceindex/conf/faceindex.env

echo "--- Installing FaceIndex to local VM ---"
sudo yum install -y faceindex
/opt/faceindex/setup/updateDb.sh

if grep -qF "PYTHONPATH" $FACEINDEX_ENV; then
	echo "PYTHONPATH exists in faceindex.env, updating variable"
	sudo sed -i.bak '/PYTHONPATH/{$s/=.*/=\/opt\/faceindex\/lib_cpu\/python2.7\/site-packages:$PYTHONPATH/}' $FACEINDEX_ENV
else
	echo "PYTHONPATH did not exist in faceindex.env, adding variable"
	echo 'export PYTHONPATH=/opt/faceindex/lib_cpu/python2.7/site-packages:$PYTHONPATH' | sudo tee -a $FACEINDEX_ENV
fi

echo "Restarting services"
sudo systemctl restart faceindex
sudo systemctl restart kerbproxy

echo "--- Installation Complete ---"
