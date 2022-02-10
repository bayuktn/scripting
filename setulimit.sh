#!/bin/bash
echo "fs.file-max = 524288" >> /etc/sysctl.conf
cat >> /etc/security/limits.conf << EOF
root soft     nproc          524288
root hard     nproc          524288
root soft     nofile         524288
root hard     nofile         524288
EOF
echo "session required          pam_limits.so" >> /etc/pam.d/common-session
