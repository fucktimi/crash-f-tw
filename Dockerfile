FROM alpine:latest

RUN apk --no-cache --update add ca-certificates libcap tzdata curl cargo && \
    apk add python3 py3-pip && \
	rm -rf /var/cache/apk/* && \
    mkdir /crashfever && \
    curl -L -o zstandard-0.20.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl https://files.pythonhosted.org/packages/bc/e3/11d05c62ade3896b74b0a42f8c8821f6d45e5565302ad2b0d1917aaa2eb3/zstandard-0.20.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl && \
    pip3 install zstandard-0.20.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl && \
    pip3 install zstandard && \
    pip3 install mitmproxy && \
    curl -L -o addons.py https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/addons.py && \
    curl -L -o mitm.sh https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/mitm.sh && \
    curl -L -o unit-list.json https://raw.githubusercontent.com/fucktimi/crash-f-tw/main/unit-list.json && \
    cp -r * /crashfever/ && \
    rm -rf * && \
    chmod +x /crashfever/mitm.sh


EXPOSE 8080/tcp
CMD /crashfever/mitm.sh
