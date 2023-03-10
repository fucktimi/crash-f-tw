FROM ubuntu:latest

RUN apt update && \
    apt -y install curl python3 python3-pip && \
    mkdir /crashfever/ && \
    #python3 -m pip install zstandard && \
    python3 -m pip install mitmproxy && \
    curl -L -o /crashfever/addons.py https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/addons.py && \
    curl -L -o /crashfever/mitm.sh https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/mitm.sh && \
    curl -L -o /crashfever/unit-list.json https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/unit-list.json && \
    #cp -r * /crashfever/ && \
    #rm -rf * && \
    chmod +x /crashfever/mitm.sh


EXPOSE 8080/tcp
VOLUME /crashfever

CMD /crashfever/mitm.sh
