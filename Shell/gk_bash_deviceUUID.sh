#!/bin/sh

#-------
# Connected Device UDID
#-------

function getUDID {
  udid=($(system_profiler SPUSBDataType | grep -A 11 -w "iPad\|iPhone\|iPad" | grep "Serial Number" | awk '{ print $3 }'))
  if [ -z $udid ]; then
    echo "No device detected. Please ensure an iOS device is plugged in."
    exit 1
  else
    for i in "${udid[@]}"; do
    echo -n $i | pbcopy
    echo ""
    echo "${CYAN}UDID: ${BOLD}${YELLOW}$i"
    echo ""
    done
  fi
}