FROM scratch AS minimal

ADD dist/rootfs.tar.gz /

FROM scratch AS tz
COPY --from=minimal / /
ENV PATH=/usr/sbin:/usr/bin:/sbin:/bin
RUN apk add tzdata --no-cache && rm -rf /var/cache/apk/*

FROM minimal AS base
COPY --from=tz /usr/share/zoneinfo/PRC /etc/localtime

RUN apk add ca-certificates --no-cache && rm -rf /var/cache/apk/*
RUN apk upgrade --available --no-cache && rm -rf /var/cache/apk/*

FROM scratch AS alpine
COPY --from=base / /

CMD ["/bin/bash"]

