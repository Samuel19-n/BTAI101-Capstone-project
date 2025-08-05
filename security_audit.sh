 GROUP 9
SAMUEL ARKOH -TWUM : 052442620033
FOSTER AGYEMANG : 052442620026
AMEDZA EDITH : 052442620008
#!/bin/bash
REPORT_FILE=~/myproject/docs/audit_report.txt
DATE=$(date '+%Y-%m-%d %H:%M:%S')
# Function to generate the report header
generate_header() {
 echo "Security Audit Report - $DATE" > "$REPORT_FILE"
 echo "======================================" >> "$REPORT_FILE"
}
# Function to audit open ports
audit_open_ports() {
 echo "2. Open Ports" >> "$REPORT_FILE"
 echo "-------------" >> "$REPORT_FILE"
 ss -tunl | grep LISTEN >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"
}
# Function to audit failed logins
audit_failed_logins() {
 echo "3. Failed Login Attempts" >> "$REPORT_FILE"
 echo "------------------------" >> "$REPORT_FILE"
 sudo grep -a "authentication failure" /var/log/auth.log >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"
}
# Function to audit user permissions
audit_user_permissions() {
 echo "4. User Permissions" >> "$REPORT_FILE"
 echo "-------------------" >> "$REPORT_FILE"
 ls -l /etc/passwd >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"
}
# Main script execution
generate_header
audit_open_ports
audit_failed_logins
audit_user_permissions
echo "Audit completed successfully." >> "$REPORT_FILE"
