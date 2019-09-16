#!/bin/sh

function parse-prov(){
if [ ! $# == 1 ]; then
echo "Usage: $0 (path/to/mobileprovision)"
exit
fi

mp=$1

uuid=`./mpParse -f ${mp} -o uuid`

echo "Found UUID $uuid"

output="~/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"

echo "copying to $output.."
cp "${mp}" "$output"

echo "done"
}