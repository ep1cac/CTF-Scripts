#!/bin/bash
# Convert PBKDF2-HMAC-SHA256 into hashcat-crackable format
# Usage: ./pbkdf2-hmac-sha256.sh <hash_file>

OUTFILE='./crackable_hashes.txt'
TEMPFILE='./crackable_hashes.tmp'

while read -r line; do
        IFS='$' read -r head salt hash <<< "$line"
        b64_salt=$(echo -n "$salt" | base64)
        b64_hash=$(echo -n "$hash" | xxd -r -p | base64)
        crackable_hash="$head:$b64_salt:$b64_hash"
        echo "$crackable_hash" >> "$OUTFILE"
done < "$1"

sed 's/\$/\:/g' "$OUTFILE" > "$TEMPFILE"
mv "$TEMPFILE" "$OUTFILE"