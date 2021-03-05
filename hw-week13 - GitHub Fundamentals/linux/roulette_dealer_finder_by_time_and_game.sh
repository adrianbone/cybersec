#!/bin/bash

echo "Please run with ./roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$5' '$6'"


cat $1_Dealer_schedule | awk -F" " '{print $1, $2, '$3','$4' }'| grep "$2"
