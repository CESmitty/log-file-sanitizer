#!/bin/bash

# A simple log sanitizer script using a text processing pipeline

INPUT_FILE=$1
OUTPUT_FILE="sanitized_$(basename $INPUT_FILE)"

# Check if an input file was provided
if [ -z "$INPUT_FILE" ]; then
    echo "Usage: $0 <log_file_to_clean>"
    exit 1
fi

echo "--- Starting Sanitization of $INPUT_FILE ---"

# 1. Use sed to replace all IPv4 addresses with a placeholder
#    (A basic regex to match four octets)
# 2. Use grep to filter out log lines containing the word 'DEBUG' 
# 3. Save the result to the new file.
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/[ANONYMIZED_IP]/g' "$INPUT_FILE" | \
grep -v 'DEBUG' > "$OUTPUT_FILE"

# Count how many IPs were replaced (before the grep -v step for accuracy, 
# but for simplicity, we'll just count how many of the placeholders are in the output)
IP_COUNT=$(grep -o '\[ANONYMIZED_IP\]' "$OUTPUT_FILE" | wc -l)
LINE_COUNT=$(wc -l < "$OUTPUT_FILE")

echo "Sanitization complete! Results saved to $OUTPUT_FILE"
echo "Summary:"
echo "* Lines processed and written: $LINE_COUNT"
echo "* IP Addresses replaced: $IP_COUNT"
echo "--- Done ---"
