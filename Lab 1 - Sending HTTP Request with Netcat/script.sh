#!/bin/bash

# Function to send HTTPS request using ncat and display headers
send_https_request() {
    local host="$1"
    local port="$2"
    local path="$3"
    response=$(echo -e "GET /mutillidae/src/index.php HTTP/1.1\r\nHost: $host\r\nConnection: close\r\n\r\n" | openssl s_client -quiet -connect "$host":"$port")
    echo "$response" | grep -E "HTTP/1.1|Date:|Server:|Vary:|Accept-Ranges:|Connection:|Content-Type:|Content-Language:|Expires:"
}

# Main script starts here

host="127.0.0.1"      # Local IP address
port="443"            # HTTPS port for Mutillidae
path="/mutillidae/src/index.php?page=labs/lab-1.php"

echo "Sending HTTPS request to https://$host:$port$path ..."

# Send HTTPS request and display headers
send_https_request "$host" "$port" "$path"

exit 0
