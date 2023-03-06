FROM alpine:latest

RUN apk --no-cache --update add ca-certificates libcap tzdata curl && \
    apk add python3 py3-pip && \
	rm -rf /var/cache/apk/* && \
    pip3 install mitmproxy && \
    curl -L -o mitm.sh
