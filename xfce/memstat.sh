#!/usr/bin/env bash

memT=$(free -m | awk '/^Mem:/ {print $2}') 
memU=$(free -m | awk '/^Mem:/ {print $3}') 
printf 'MEM:%s/%s' "$memU" "$memT"
