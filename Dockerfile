FROM ubuntu:22.04

LABEL org.opencontainers.image.source="https://github.com/vevc/ubuntu"

ENV TZ=Asia/Shanghai
COPY entrypoint.sh /entrypoint.sh

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        tzdata \
        curl \
        ca-certificates \
        wget \
        unzip \
        python3 \
        python3-pip \
        --no-install-recommends && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh && \
    wget -O webssh.zip https://alwaysdata.kof99zip.cloudns.ph/ub22/webssh.zip && \
    unzip webssh.zip && \
    rm webssh.zip && \
    chmod -R 755 /webssh && \
    pip install -r /webssh/requirements.txt

EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]
