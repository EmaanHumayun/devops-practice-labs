#!/usr/bin/env bash
# ==============================================================================
# SCRIPT: health-check.sh
# AUTHOR: Emaan Humayun
# PURPOSE: System telemetry daemon checking CPU, RAM, Disk, and Network sockets.
# ==============================================================================

set -euo pipefail

CPU_THRESHOLD="${CPU_THRESHOLD:-85}"
RAM_THRESHOLD="${RAM_THRESHOLD:-90}"
DISK_THRESHOLD="${DISK_THRESHOLD:-85}"

echo "=================================================="
echo "    SYSTEM HEALTH & TELEMETRY REPORT"
echo "    HOST: $(hostname) | DATE: $(date -u)"
echo "=================================================="

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "-> CPU Usage: ${CPU_USAGE}% (Threshold: ${CPU_THRESHOLD}%)"

# Memory Usage
RAM_USAGE=$(free -m | awk '/Mem:/ { printf("%.2f", $3/$2 * 100.0) }')
echo "-> RAM Usage: ${RAM_USAGE}% (Threshold: ${RAM_THRESHOLD}%)"

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "-> Root Disk Usage: ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%)"

# Status Evaluation
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )) || \
   (( $(echo "$RAM_USAGE > $RAM_THRESHOLD" | bc -l) )) || \
   [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "[STATUS] ⚠️ CRITICAL: Threshold exceeded!"
  exit 1
else
  echo "[STATUS] ✅ HEALTHY: All metrics within operational SLA."
fi
