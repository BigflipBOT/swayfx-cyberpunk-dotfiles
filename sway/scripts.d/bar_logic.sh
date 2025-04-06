while true
do
	date=$(date +'%d/%m/%Y')
	time=$(date +'%X')
	batt=$(cat /sys/class/power_supply/BAT1/capacity)"%"
  conn=$(iwctl station list | head -n +5 | tail -n -1 | awk '{print $2 ": " $3}') # frist station from list

	echo "$conn | $batt | $date | $time"
	sleep 1
done
