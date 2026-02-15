#!/bin/bash
PATH=/usr/bin:/bin:/usr/sbin:/sbin
echo "==== SYSTEM MONITOR REPORT ===="
echo "Date: $(date)"
echo

echo "CPU LOad:"
uptime
echo

echo "Memory Usage:"
free -h
echo

echo "Disk Usage:"
df -h
echo

echo "Running Services (Samba & SSH):"
systemctl is-active smbd
systemctl is-active ssh

