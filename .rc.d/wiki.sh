# Get some short info on a subject
function wiki () {
	if [ $# -gt 0 ];
	then
		dig +short txt $1.wp.dg.cx
	else
		printf "\nUsage: wiki SUBJECT\n";
	fi
}

