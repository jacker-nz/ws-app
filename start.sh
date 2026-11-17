#!/bin/sh
cd "$(dirname "$0")"
if [ ! -x ./bin/xray ]; then
  mkdir -p ./bin
  curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip
  unzip -o /tmp/xray.zip -d ./bin || python3 -m zipfile -e /tmp/xray.zip ./bin/
  chmod +x ./bin/xray
fi
sed "s/UUID_PLACEHOLDER/${UUID}/g; s/PORT_PLACEHOLDER/${PORT:-8080}/g" config.json > /tmp/config.json
exec ./bin/xray run -c /tmp/config.json
