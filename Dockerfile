FROM alpine:3.8
MAINTAINER Hyper <hyper@dakalab.com>

RUN apk add --no-cache vsftpd
RUN rm -rf /var/cache/apk/*

COPY vsftpd.conf /etc/vsftpd/
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN adduser -h /home/files -s /bin/false -D files

VOLUME /home/files

EXPOSE 20 21 21100-21110

CMD ["/docker-entrypoint.sh"]
