# The Log File Sanitizer log_sanitizer.sh
This script, log_sanitizer.sh, was created to address the critical need for data privacy and log analysis efficiency in a development environment. We needed a fast, repeatable way to anonymize sensitive data (like IP addresses) from production logs before sharing them with third-party or junior teams for debugging, thus mitigating security risks and focusing analysis on the relevant events.

The script uses a robust Bash pipeline to perform these cleaning operations in a single, efficient pass.

## 📋 Instructions for Use
Clone the Repository:

Run the Script: The script requires one argument: the path to the log file you wish to clean.

Review Output: A new file, named sanitized_input.log, will be created in the current directory with all PII replaced and unnecessary lines filtered out.

## 🧪 Testing via CodeSpace
You can test this script instantly using GitHub CodeSpaces:

Click the <> Code button on this repository's main page.

Select Create codespace on main.

Once the CodeSpace loads, you can use the example sample.log file included in this repo (you should include one!).

Run the test:

## 📜 Licensing & Attribution
Licensing: This project is licensed under the MIT License. (You will need to create a simple LICENSE.md file in your repo).

Attribution: Script idea generated with assistance from [ChatBot Name, e.g., Google's Gemini]. Pipeline logic and best practices were informed by North Seattle College's Intro to Linux Course materials (specifically the Text Processing Labs).
