#!/bin/env bash

TIME=(`date +"%T %u"`)
DAY=${TIME[1]}
TIME=${TIME[0]}

cat /home/taytek/.config/i3/bell_schedule.txt | while read line || [[ -n $line ]];
do
	line_time=`echo $line | awk '{print $2}'`;
	line_date=`echo $line | awk '{print $1}'`;

	if [[ $TIME < $line_time ]] && echo $line_date | grep -q $DAY ; then
		diff=$(( $(date -d $line_time +'%s') - $(date -d $TIME +'%s') ));
		printf "%02d:%02d:%02d" "$(( $(($diff/60))/60 ))" "$(( $diff/60%60 ))" "$(( $diff%60))";
		echo -n $line | awk '{$1=""; $2=""; print " until"substr($0,2)""}';
		break
	fi
done

