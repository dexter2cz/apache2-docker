#!/bin/bash
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /run/apache2/apache2.pid

exec /usr/sbin/apache2ctl -DFOREGROUND

