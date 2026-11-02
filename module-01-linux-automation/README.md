# Module 01: Linux Administration & Shell Automation

## Objective
Master foundational Linux system administration, service management, cron scheduling, and bash scripting for automated maintenance.

## Exercises Included
1. **Health Check Script (`scripts/health-check.sh`):**
   - Monitors CPU usage, Memory availability, Disk space, and active zombie processes.
   - Emits alerts when thresholds (>85% disk, >90% memory) are exceeded.
2. **Backup & Rotation Daemon (`scripts/backup-and-rotate.sh`):**
   - Creates timestamped tarball archives of critical application directories.
   - Enforces a 7-day retention policy, automatically purging expired archives.

## How to Run & Verify
```bash
# 1. Make executable
chmod +x scripts/*.sh

# 2. Run system health check
./scripts/health-check.sh

# 3. Test backup rotation
./scripts/backup-and-rotate.sh /tmp/test-data /tmp/backups
```
