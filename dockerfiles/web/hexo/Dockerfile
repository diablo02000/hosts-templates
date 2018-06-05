FROM diablo02000/nodejs:7

MAINTAINER Diablo02000

RUN apt-get install -y --no-install-recommends git && \
    npm install hexo-cli -g && \
    mkdir -p /var/hexo

WORKDIR /var/hexo

VOLUME /var/hexo

COPY docker-entrypoint.sh /opt/

ENTRYPOINT ["/opt/docker-entrypoint.sh"]

CMD ["hexo"]
