#!/usr/bin/env bash
# ==============================================================================
# SCRIPT: backup-and-rotate.sh
# AUTHOR: Emaan Humayun
# PURPOSE: Automated archive compression, timestamping, checksum, and rotation.
# ==============================================================================

set -euo pipefail

SOURCE_DIR="${1:-/var/log/app}"
BACKUP_DIR="${2:-/var/backups/app}"
RETENTION_DAYS="${3:-7}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="backup_${TIMESTAMP}.tar.gz"

mkdir -p "${BACKUP_DIR}"

echo "[INFO] Starting backup of ${SOURCE_DIR} at $(date)..."

if [ ! -d "${SOURCE_DIR}" ]; then
  echo "[WARN] Source directory ${SOURCE_DIR} does not exist. Creating dummy sample for lab."
  mkdir -p "${SOURCE_DIR}"
  echo "Sample production log entry - $(date)" > "${SOURCE_DIR}/production.log"
fi

tar -czf "${BACKUP_DIR}/${ARCHIVE_NAME}" -C "${SOURCE_DIR}" .
sha256sum "${BACKUP_DIR}/${ARCHIVE_NAME}" > "${BACKUP_DIR}/${ARCHIVE_NAME}.sha256"

echo "[SUCCESS] Created backup: ${BACKUP_DIR}/${ARCHIVE_NAME}"
echo "[INFO] Rotating archives older than ${RETENTION_DAYS} days..."

find "${BACKUP_DIR}" -type f -name "backup_*.tar.gz" -mtime +"${RETENTION_DAYS}" -exec rm -f {} \;
find "${BACKUP_DIR}" -type f -name "backup_*.tar.gz.sha256" -mtime +"${RETENTION_DAYS}" -exec rm -f {} \;

echo "[SUCCESS] Rotation complete. Current backups in ${BACKUP_DIR}:"
ls -lh "${BACKUP_DIR}"

