# Clear the screen with some information
function con {

	clear;
	printf "\n+--------------------------------+\n|";
	pwd;
	printf " : ";
	date;
	printf "+--------------------------------+\n\n";

	EXPECTED_ARGS=2
	if [ $# -lt $EXPECTED_ARGS ] && [ $# -gt 0 ];
	then
	    con $1 -s
        printf "\n"
    elif [ $# -lt 1 ];
    then
        printf "Usage: <name> -h\n"
    else
		case "$2" in
			-h | --help)
				printf "Usage: $1 [options] [URL] \nURL: The target path to show info on\nOptions:\n
\t t,   travelto\t\tSame as -t.
\t-t, --traverse\t\tNavigate to the specified folder.
\t-h, --help\t\tDisplay this information.
\t-n, --empty\t\tDisplays nothing but current directory.
\t-c, --clear-display\tDisplay just some information (will not work if 'dir' is not available).\n

";
				;;
			-a | --append)
				con $1 -s
				if [ -z "$3" ];
				then
					printf "\n";
					ls -lah --color=always -t | tail -n +2
				else
					printf "\n"
					ls -lah $3 --color=always -t | tail -n +2
				fi
				;;
			-q | --qoute)
				con $1 -s
				printf "\n";
				fortune;
				printf "\n";
				;;
			-n | --empty)
				printf "\n";
				;;
			-c | --clear-display)
				dir;
				printf "\n";
				;;
			s | -s | --show-dir)
				if [ -z "$3" ];
				then
					ls -lah --color=always;
                    jobs;
				else
					ls -lah $3 --color=always;
                    jobs;
				fi
				;;
			u | -u | --up | travelup)
				if [ -z "$3" ];
				then
					cd ..;
					con $1 -s;
				else
					for (( i=0; i<$3; i++ ))
	 				 do
						cd ..;
					 done

					con $1 -s;
				fi
				;;
			-t | t | travelto)
				if [ -z "$3" ];
				then
					con $1 $3;
				else
					con $1;
				fi
			;;
			*)
				if [ -z "$2" ];
				then
					con $1 -s
				elif [ -f $2 ];
                then
                    path=`dirname $2`
                    cd $path
                    
                    $EDITOR $2 && con $1 -s
                elif [ -d $2 ];
                then
                    cd "$2";

                    con $1 -s
                fi
			;;
		esac
	fi

}

EDITOR=/usr/bin/vi
alias cls='con cls'
