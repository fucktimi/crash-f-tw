FROM alpine:latest

RUN apk --no-cache --update add ca-certificates libcap tzdata curl && \
    apk add python3 py3-pip && \
	rm -rf /var/cache/apk/* && \
    mkdir /crashfever && \
    sudo pip3 install mitmproxy && \
    curl -L -o addons.py https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/addons.py && \
    curl -L -o mitm.sh https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/mitm.sh && \
    curl -L -o unit-list.json https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/unit-list.json && \
    cp -r * /crashfever/ && \
    rm -rf * && \
    chmod +x /crashfever/mitm.sh


EXPOSE 8080/tcp
CMD /crashfever/mitm.sh
