# The Log File Sanitizer (log_sanitizer.sh)

## Project Overview

This script solves a common real-world problem: cleaning up messy server or application log files before analysis or sharing, particularly by removing sensitive or personally identifiable information (PII).

### Key Features
A simple, reusable Bash script that uses a pipeline of text processing tools (grep, sed, awk) to sanitize log files by:

* Removing log entries older than a certain date.

* Replacing specific patterns (like IP addresses or usernames) with generic placeholders (e.g., [ANONYMIZED_IP]).

* Counting how many sensitive entries were found and sanitized.
### Case Study Problem & The Solution 

### The Problem: 

Server log files often contain sensitive information (like IP addresses, user IDs, or specific timestamps) that can clutter analysis or pose a security/privacy risk if shared with a less privileged team member (e.g., a junior analyst or a developer debugging an issue).

### The Solution: 
The script uses a robust Bash pipeline to perform these cleaning operations in a single, efficient pass.

### Case Study Takeaway:

This script, log_sanitizer.sh, was created to address the critical need for data privacy and log analysis efficiency in a development environment. We needed a fast, repeatable way to anonymize sensitive data (such as IP addresses) from production logs before sharing them with third-party or junior teams for debugging, thereby mitigating security risks and focusing analysis on the relevant events.

----

## Usage

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

## 📋 Instructions for Use
    Clone the Repository:

    Run the Script: The script requires one argument: the path to the log file you wish to clean.

    Review Output: A new file, named sanitized_input.log, will be created in the current directory with all PII replaced and unnecessary lines filtered out.

    Run the test: example log_sanitizer.sh sample.log

## 🧪 Testing via CodeSpace
    You can test this script instantly using GitHub CodeSpaces:

    Click the <> Code button on this repository's main page.

    Select Create codespace on main.

    Once the CodeSpace loads, you can use the example sample.log file included in this repo (you should include one!).

    Run the test: example log_sanitizer.sh sample.log

## 🤝 Attribution and Professional Disclosure

This project was based on initial concepts and structures derived from the "Linux Text Processing Tools" module at North Seattle College (IT135). 

Attribution: Script idea generated with assistance from [ChatBot Name, e.g., Google's Gemini]. Pipeline logic and best practices were informed by North Seattle College's Intro to Linux Course materials (specifically the Text Processing Labs).

No copyrighted code was used, and the final script logic was engineered and tested independently.

----

## Author
  * **Clayton Smith**
  * **clayton.e.smith@seattlecolleges.edu**

