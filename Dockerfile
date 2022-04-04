FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
	x-ray_Newv=`wget --no-check-certificate -qO- https://api.github.com/repos/XTLS/x-ray-core/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -b 2-` && \
    wget -qO x-ray.zip https://github.com/XTLS/x-ray-core/releases/download/v$ray_Newv/x-ray-linux-64.zip && \
    busybox unzip x-ray.zip && \
    chmod +x /x-ray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
