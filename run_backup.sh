#!/bin/bash

# Set log folder and file
LOG_DIR="/ansible/logs"
mkdir -p "$LOG_DIR"              # create folder if not exist
LOG_FILE="$LOG_DIR/run_backup.log"

# Redirect stdout and stderr to log file
exec >> "$LOG_FILE" 2>&1

# Start message
echo "=== RUN START: $(date -u '+%Y-%m-%dT%H:%M:%SZ') user=$(whoami) pwd=$(pwd) ==="

# Make script fail on errors in pipelines
set -o pipefail

# Trap to log exit status
trap 'rc=$?; echo "=== EXIT $rc: $(date -u '+%Y-%m-%dT%H:%M:%SZ') ==="; exit $rc' EXIT

# Run your ansible playbook
ansible-playbook /ansible/playbook.yml --tags backup,remove_old_backup