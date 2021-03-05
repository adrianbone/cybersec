#/bin/bash

cat 0310_Dealer_schedule | grep '05:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | grep '08:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | grep '02:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | grep '08:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | grep '11:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0312_Dealer_schedule | grep '05:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0312_Dealer_schedule | grep '08:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0312_Dealer_schedule | grep '02:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0312_Dealer_schedule | grep '08:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0312_Dealer_schedule | grep '11:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0315_Dealer_schedule | grep '05:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0315_Dealer_schedule | grep '08:00:00 AM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses
cat 0315_Dealer_schedule | grep '02:00:00 PM' | awk '{ print $1,$2,$5,$6 }' >> Dealers_working_during_losses

