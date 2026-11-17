FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates && \
    curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip && \
    mkdir -p /usr/local/xray && unzip /tmp/xray.zip -d /usr/local/xray && \
    chmod +x /usr/local/xray/xray && rm /tmp/xray.zip
COPY config.json /usr/local/xray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
