# Security Audit Script

A Bash script that performs a daily quick security check on a Linux system. It gathers vital information including open ports, failed login attempts, and system user data, and writes it all into a neatly formatted report file.

---

## Overview

This script performs the following checks:
- Lists open TCP/UDP network ports
- Extracts the last 10 failed login attempts
- Displays system users and their User IDs (UIDs)
- Outputs results to: `~/myproject/docs/audit_report.txt`

---

## What the Script Does

- **Generates Timestamped Header**
  - Retrieves current date and time
  - Writes a report title and divider

- **Checks Open Ports**
  - Uses `ss` to list all listening ports and their states

- **Finds Failed Login Attempts**
  - Searches `/var/log/auth.log` for the last 10 "Failed password" entries

- **Lists System Users**
  - Reads `/etc/passwd` and displays usernames with UID numbers

- **Writes to Report File**
  - Saves output in: `~/myproject/docs/audit_report.txt`

- **Displays Completion Message**
  - Appends a timestamped success message

---

## How It Works (Step-by-Step)

```bash
# Define Variables
REPORT_FILE=~/myproject/docs/audit_report.txt
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Write Header
echo "Security Audit Report - $DATE" > "$REPORT_FILE"
echo "===============================" >> "$REPORT_FILE"

# Check Open Ports
ss -tuln >> "$REPORT_FILE"

# Find Failed Logins
grep "Failed password" /var/log/auth.log | tail -n 10 >> "$REPORT_FILE"

# List Users and UIDs
cut -d: -f1,3 /etc/passwd >> "$REPORT_FILE"

# Completion Message
echo -e "\nAudit completed successfully on $DATE" >> "$REPORT_FILE"

## How to Execute the Script
# Make it executable (only needed once)
chmod +x ~/myproject/scripts/security_audit.sh

# Run the script
~/myproject/scripts/security_audit.sh

# View the report
cat ~/myproject/docs/audit_report.txt

## Permissions
## Some commands, like reading /var/log/auth.log, may require root access.

#If you encounter Permission denied errors, run the script with sudo

sudo ~/myproject/scripts/security_audit.sh

#Can be automated using cron or systemd for daily auditing
