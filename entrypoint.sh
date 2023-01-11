#!/bin/sh

# Ensure presence of all needed variables
[ -z "$USERNAME" ] || echo "USERNAME not given, exit." && exit 1
[ -z "$CLIENT_ID" ] || echo "CLIENT_ID not given, exit." && exit 1
[ -z "$CLIENT_SECRET" ] || echo "CLIENT_SECRET not given, exit." && exit 1

# Write config.py config file from Docker env variables
cat <<EOF > /opt/config.py
root_path = "/opt/recordings"
username = "$USERNAME"
client_id = "$CLIENT_ID"
client_secret = "$CLIENT_SECRET"
EOF

# Hand off to the CMD
exec "$@"
