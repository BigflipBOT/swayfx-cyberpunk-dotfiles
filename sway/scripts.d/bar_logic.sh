color(){
  text=$1 
  color_hex=$2
  echo "<span foreground='${color_hex}'>${text}</span>"
}


while true
do
  # set values of custom variables
	date=$(date +'%d/%m/%Y')
	time=$(date +'%X')
	batt=$(cat /sys/class/power_supply/BAT1/capacity)"%"
  conn=$(iwctl station list | head -n +5 | tail -n -1 | awk '{print $2 ": " $3}') # frist station from list
  sound=$(echo "sound: $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))")

  separator=$(color " | " "#511E1E")

  # insert variables in wanted order into the array
  modules=("$sound" "$conn" "$batt" "$date" "$time")

  # array print
  printval=""
  modules_size=${#modules[@]}
  for ((i = 0; i < modules_size; i++)); do
    printval+=$(echo ${modules[$i]})
    if [[ $i+1 -lt modules_size ]]; then printval+=$separator; fi
  done

  echo $printval

	sleep 1
done
