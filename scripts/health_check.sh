#!/bin/bash

echo "===== Server Health Check ====="

# Nginx check
if systemctl is-active --quiet nginx; then
    echo "Nginx: PASS"
else
    echo "Nginx: FAIL"
fi

# Website check
if curl -s -o /dev/null -w "%{http_code}" http://localhost | grep -q "200"; then
    echo "Website: PASS"
else
    echo "Website: FAIL"
fi

# Disk check
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -lt 80 ]; then
    echo "Disk: PASS ($DISK_USAGE% used)"
else
    echo "Disk: WARNING ($DISK_USAGE% used)"
fi

echo "===== Check Complete ====="
