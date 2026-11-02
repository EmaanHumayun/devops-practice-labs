#!/usr/bin/env bash
# Network Diagnostics & Port Reachability Validator
set -euo pipefail

TARGET_HOST="${1:-1.1.1.1}"
TARGET_PORT="${2:-80}"

echo "================================================="
echo "  🌐 Running Network Diagnostics for $TARGET_HOST"
echo "================================================="

echo -n "[1] Checking DNS resolution... "
if host "$TARGET_HOST" >/dev/null 2>&1; then
    echo "OK"
else
    echo "SKIPPED/IP DIRECT"
fi

echo -n "[2] Checking ICMP ping connectivity... "
if ping -c 2 -W 2 "$TARGET_HOST" >/dev/null 2>&1; then
    echo "SUCCESS"
else
    echo "ICMP BLOCKED OR HOST UNREACHABLE"
fi

echo -n "[3] Checking TCP port $TARGET_PORT connectivity... "
if nc -z -w 3 "$TARGET_HOST" "$TARGET_PORT" 2>/dev/null; then
    echo "PORT OPEN"
else
    echo "PORT CLOSED OR FILTERED"
fi
echo "================================================="
