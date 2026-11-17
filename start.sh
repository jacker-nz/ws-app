#!/bin/sh
sed -i "s/UUID_PLACEHOLDER/${UUID}/g; s/PORT_PLACEHOLDER/${PORT:-8080}/g" /usr/local/xray/config.json
exec /usr/local/xray/xray run -c /usr/local/xray/config.json
