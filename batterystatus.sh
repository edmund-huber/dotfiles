#!/bin/bash
#
# battery status script
#

BATTERY=/sys/class/power_supply/BAT0/

REM_CAP="$(cat $BATTERY/charge_now)"
FULL_CAP="$(cat $BATTERY/charge_full)"
BATSTATE="$(cat $BATTERY/status)"

CHARGE=`echo $(( $REM_CAP * 100 / $FULL_CAP ))`

NON='\033[00m'
BLD='\033[01m'
RED='\033[01;31m'
GRN='\033[01;32m'
YEL='\033[01;33m'

COLOUR="$RED"

case "${BATSTATE}" in
   'FULL')
   BATSTT="$BLD=$NON"
   ;;
   'Charging')
   BATSTT="$BLD+$NON"
   ;;
   'Discharging')
   BATSTT="$BLD-$NON"
   ;;
esac

# prevent a charge of more than 100% displaying
if [ "$CHARGE" -gt "99" ]
then
   CHARGE=100
fi

if [ "$CHARGE" -gt "15" ]
then
   COLOUR="$YEL"
fi

if [ "$CHARGE" -gt "30" ]
then
   COLOUR="$GRN"
fi

echo -e "${BATSTT}${COLOUR}${CHARGE}%${NON}"
