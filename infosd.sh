#!/bin/bash


echo "     _____               _             ";
echo "    |____ |             | |            ";
echo " ____   / /_ __ ___   __| | __ _ _   _ ";
echo "|_  /   \ \ '__/ _ \ / _\` |/ _\` | | | |";
echo " / /.___/ / | | (_) | (_| | (_| | |_| |";
echo "/___\____/|_|  \___/ \__,_|\__,_|\__, |";
echo "                                  __/ |";
echo "                                 |___/ ";





_zenity="/usr/bin/zenity"
_out="/tmp/whois.output.$$"
domain=$(${_zenity} --title  "Enter domain" \
	            --entry --text "Enter the domain you would like to see whois info by z3roday-sudan" )
 
if [ $? -eq 0 ]
then

  whois $domain  | tee >(${_zenity} --width=200 --height=100 \
  				    --title="whois" --progress \
			            --pulsate --text="Searching domain info..." \
                                    --auto-kill --auto-close \
                                    --percentage=10) >${_out}
 
 
  ${_zenity} --width=800 --height=600  \
	     --title "Whois info for $domain" \
	     --text-info --filename="${_out}"
else
  ${_zenity} --error \
	     --text="No input provided"
fi
