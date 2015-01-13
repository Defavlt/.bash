
function search () {
	
	if [ $# -gt 1 ];
	then
		case "$1" in
			-n | --lines)
				if [ $# -eq 3 ];
				then
					sudo awk "$2"' { count++ } END { printf count;printf "\n";}' $3
				else
					search;
				fi
			;;
			*)
				if [ $# -eq 2 ];
				then
					sudo awk -Fs "$1" $2;
				elif [ $# -gt 2 ];
				then
					sudo awk -Fs $1 $2 $3;
				else
					search;
				fi
			;;
		esac
	else
		printf "Usage: [-n] search file\n"
	fi
}

