#!/bin/bash

# Find where I am plugged into!
# Requires Cisco CDP
# @Author Joe Talerico

command -v tcpdump >/dev/null 2>&1 || { echo >&2 "I require tcpdump but it's not installed.  Aborting."; exit 1; }

if [ -z "$1" ]
  then
    echo "Error : Pass interface to listen on."
    echo "Usage : ./whereami.sh eth0"
    exit 1
fi

SWITCH=""
PORT=""
DEBUG=false
output=$(timeout 60 tcpdump -vvv -i $1 2>&1 | grep -E "Ethernet[0-9]" -B5 -A5)
if [[ -z $output ]] ; then 
  echo "Error : Is CDP enabled?"
  exit 1
fi
SWITCH=$(echo "${output}" | grep "Address" | awk '{print $8}')
PORT=$(echo "${output}" | grep "Port-ID" | awk '{print $6}')
echo "Connected to : ${SWITCH}"
echo "On interface : ${PORT}"

if $DEBUG ; then
  echo "DEBUG"
  echo "${output}"
  echo "DEBUG"
fi

