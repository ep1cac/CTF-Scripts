#!/bin/bash

# md5 hash -> user:<hash> -> base64 cookie && cookie-password map

while read -r line
do
        hash=$(printf "$line" | md5sum | cut -d ' '  -f1)
        cookie=$(printf "carlos:$hash" | base64)
        echo "$cookie" >> cookies.txt
        echo "$cookie: $line" >> map.txt
done <<< $(cat pass.txt)