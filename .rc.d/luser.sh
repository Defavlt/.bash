
function luser () {

	if [ $# -lt 1 ];
	then
		users --help;
	else
		case "$1" in
			-a | --active)
				luser;
			;;
			-l | --all)
	    		cat /etc/passwd | cut -d: -f1;
			;;
			-r | --real)
				cat /etc/passwd | cut -d: -f5;
			;;
			-h | --help)
				printf "Usage: luser [-a | -l | -r | -h] \n";
			;;
			*)
				luser -h;
			;;
		esac
	fi
}

