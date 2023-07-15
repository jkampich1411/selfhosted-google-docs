#!/bin/bash

echo
echo
echo

LOCAL_IPV4=$(/sbin/ip -4 addr show dev eth0 | grep inet | awk '{print $2}' | cut -d "/" -f 1)
LOCAL_IPV6=$(/sbin/ip -6 addr show dev eth0 | grep inet6 | awk -F '[ \t]+|/' '$3 == "::1" { next;} $3 ~ /^fe80::/ { next ; } /inet6/ {print $3} ')

read -p "Please enter your DuckDNS token: " DDNS_TOKEN
read -p "Enter your subdomain: " DDNS_SUBDOMAIN

DDNS_REQ_CLEAR="https://www.duckdns.org/update?clear=true&domains=$DDNS_SUBDOMAIN&token=$DDNS_TOKEN"
DDNS_REQ_SET="https://www.duckdns.org/update?ip=$LOCAL_IPV4&ipv6=$LOCAL_IPV6&domains=$DDNS_SUBDOMAIN&token=$DDNS_TOKEN"

DDNS_OK="OK"
DDNS_NOT_OK="KO"

echo
echo "The following settings will be applied:"
echo "(These should be fine but please check the Hetzner Portal anyway!)"
echo "IPv4 Address: $LOCAL_IPV4"
echo "IPv6 Address: $LOCAL_IPV6"

echo
echo "They will be applied to the following account"
echo "(Please double-check with the DuckDns Portal!"
echo "Token: $DDNS_TOKEN"
echo "Domain: $DDNS_SUBDOMAIN"

echo
echo
read -p "To confirm, press (Enter)" _

echo "[-] clearing existing values"
CURL_REQ_CLEAR=$(curl -s $DDNS_REQ_CLEAR)

if [ "$CURL_REQ_CLEAR" = "$DDNS_NOT_OK" ]; then
   echo
   echo
   echo "Something went wrong"
   echo "You likely misspelled your subdomain / token. Please run the command again with the correct input!"
   exit 1
fi

echo "[+] setting new values"
CURL_REQ_SET=$(curl -s $DDNS_REQ_SET)

if [ "$CURL_REQ_CLEAR" = "$DDNS_NOT_OK" ]; then
   echo
   echo
   echo "Something went wrong"
   echo "Either the IP Addresses shown above are incorrect or you misspelled your subdomain / token!"
   echo "Please confirm the IP Addresses with the Hetzner Portal."
   echo "If the ones shown here match the ones shown in the Hetzner Portal, you misspelled your subdomain / token! Run the command again with the correct input!"
   echo "If they don't match, continue to the manual IP configuration in the guide"
   exit 1
fi

echo $CURL_REQ_SET
echo "Although it usually doesn't take so long, that it can take up to 24 hours for your domain to be updated."
echo "As said, this is often not an issue, so you can continue with the guide!"
exit 0
