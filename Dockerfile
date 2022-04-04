FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
	ray_Newv=`wget --no-check-certificate -qO- https://api.github.com/repos/XTLS/ray-core/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -b 2-` && \
    wget -qO ray.zip https://github.com/XTLS/ray-core/releases/download/v$ray_Newv/ray-linux-64.zip && \
    busybox unzip ray.zip && \
    chmod +x /ray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
