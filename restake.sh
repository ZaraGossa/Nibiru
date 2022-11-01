#!/bin/bash
for (( ;; )); do
	echo -e "\033[0;32mCollecting rewards!\033[0m"
	nibid tx distribution withdraw-rewards nibivaloper12g8jq978y8zza5x99a6k7aqvttat77wmw954uu --from=Zaragossa --commission --chain-id=$NIBIRU_CHAIN_ID --fees=100000unibi --yes
	echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
	sleep 30
	AMOUNT=$(nibid query bank balances nibi12g8jq978y8zza5x99a6k7aqvttat77wm876wgp | grep amount | awk '{split($0,a,"\""); print a[2]}' | head -1)
	AMOUNT=$(($AMOUNT - 500))
	AMOUNT_STRING=$AMOUNT"unibi"
	echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
	 nibid tx staking delegate nibivaloper12g8jq978y8zza5x99a6k7aqvttat77wmw954uu $AMOUNT_STRING --from Zaragossa --chain-id $NIBIRU_CHAIN_ID --fees=100000unibi --yes
	echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 3600 sec!\033[0m"
	sleep 3600
done
