while true
do
	date=$(date +'%d/%m/%Y')
	time=$(date +'%X')
	batt=$(cat /sys/class/power_supply/BAT1/capacity)"%"

	echo "$batt | $date | $time"
	sleep 1
done
