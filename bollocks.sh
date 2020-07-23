#!/bin/bash
while true
do
    line=$(
	tail -100 crafter.log | 
	grep 'ServerError' -m 1 -B 9999 | 
	tac | 
	head -5 |
	cut -c 22-
    )
    if [ "$line" != "$lastline" ] && [ "$line" != "" ]; then
        lastline=$line
        line=${line//\\/\\\\} # \
        line=${line//\//\\\/} # /
        # line=${line//\'/\\\'} # ' (not strictly needed ?)
        line=${line//\"/\\\"} # "
        line=${line//   /\\t} # \t (tab)
        line=${line//
        /\\\n} # \n (newline)
        line=${line//^M/\\\r} # \r (carriage return)
        line=${line//^L/\\\f} # \f (form feed)
        line=${line//^H/\\\b} # \b (backspace)
        echo '{"username": "Bollocks", "avatar_url": "https://i.imgur.com/Xn0Ursp.png", "content": "```'$line'```"}' > line
        curl \
        --header "Content-Type: application/json" -X POST \
        --data @line \
        https://discordapp.com/api/webhooks/CHANNEL_ID_HERE/API_KEY_HERE
        rm line
    fi
    sleep 1
done
