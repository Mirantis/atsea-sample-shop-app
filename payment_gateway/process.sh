#!/bin/sh

if [[ -f /run/secrets/staging-token/staging-token ]]; then
  token_file=/run/secrets/staging-token/staging-token
elif [[ -f /run/secrets/staging-token ]]; then
  token_file=/run/secrets/staging-token
else
  echo "Can't find token file! Exiting..."
  exit 1
fi

while true
do
	case "$(cat $token_file)" in
	staging)
		echo "$(date '+%s') | OK | Authenticated in staging mode, waiting for transactions..."
		;;
	production)
		echo "$(date '+%s') | OK | PRODUCTION MODE! WE'RE READY TO ROCK AND ROLL!"
		;;
	*)
		RED='\033[0;31m'
		NC='\033[0m'
		echo -e "${RED}$(date '+%s') | ERROR | Payment token WRONG!!!!!!! :(${NC}"
		exit 1
		;;
	esac
	sleep 1
done
