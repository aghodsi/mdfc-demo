#!/bin/sh
rm msg
while ! [ -s msg ]; do
    #echo "file is empty - keep checking it "
    sleep 1 # throttle the check
done
echo "file is not empty "
cat  msg
pkill -x nc > /dev/null 2>&1
