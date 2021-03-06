#
# Internet Bandwidth by IP
#

HOSTNAME=$1

IPADDRESS=`nslookup ${HOSTNAME} | awk '/^Address: / { print $2 }'`

if [[ ${IPADDRESS} =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then

rx=`wget --quiet -O - "http://10.10.0.1:666/hosts/?full=yes" |grep -A 3 -i "${IPADDRESS}/" |tail -n 1 |tail -n 1 |sed 's/ <td class="num">//'|sed 's/<\/td>//' |sed 's/,//g'`
tx=`wget --quiet -O - "http://10.10.0.1:666/hosts/?full=yes" |grep -A 4 -i "${IPADDRESS}/" |tail -n 1 |tail -n 1 |sed 's/ <td class="num">//'|sed 's/<\/td>//' |sed 's/,//g'`

fi

echo "rx:${rx} tx:${tx}"
