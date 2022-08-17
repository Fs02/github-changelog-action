FROM docker.io/alpine:latest

COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache git jq && \
    wget -O git-chglog.tar.gz \
    https://github.com/git-chglog/git-chglog/releases/download/v0.15.1/git-chglog_0.15.1_linux_amd64.tar.gz && \
    tar -xvf git-chglog.tar.gz git-chglog -C /usr/local/bin/ && \
    chmod 755 /entrypoint.sh /usr/local/bin/git-chglog

ENTRYPOINT [ "/entrypoint.sh" ]
