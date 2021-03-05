#!/bin/bash

echo "Please run with ./roulette_dealer_finder_by_time.sh date time"

cat $1_Dealer_schedule | grep "$2 $3" | awk '{ print $1,$2,$5,$6 }'
