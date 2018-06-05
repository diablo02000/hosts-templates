# From debian
FROM debian:stretch-slim
MAINTAINER diablo02000

ENV nginxVersion="1.13.10"

# Add dynamics module
ENV dynMods="http-auth-pam http-cache-purge http-dav-ext http-echo http-fancyindex http-geoip http-headers-more-filter http-image-filter http-lua http-ndk http-perl http-subs-filter http-uploadprogress http-upstream-fair http-xslt-filter mail nchan rtmp stream"

# Build nginx-common version
ENV commonConfigureFlags="--user=www-data --group=www-data --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads"

# Build nginx-light version
ENV ligthConfigureFlags="${commonConfigureFlags} --with-http_gzip_static_module --without-http_browser_module --without-http_geo_module --without-http_limit_req_module --without-http_limit_conn_module --without-http_memcached_module --without-http_referer_module --without-http_split_clients_module --without-http_userid_module"

# Build nginx-full version
ENV fullConfigureFlags="${ligthConfigureFlags} --with-http_addition_module --with-http_geoip_module=dynamic --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_xslt_module=dynamic --with-stream=dynamic --with-stream_ssl_module --with-stream_ssl_preread_module --with-mail=dynamic --with-mail_ssl_module"

# Build nginx-extras version
ENV extrasConfigureFlags="--with-http_addition_module --with-http_flv_module --with-http_geoip_module=dynamic --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_mp4_module --with-http_perl_module=dynamic --with-http_random_index_module --with-http_secure_link_module --with-http_sub_module --with-http_xslt_module=dynamic --with-mail=dynamic --with-mail_ssl_module --with-stream=dynamic --with-stream_ssl_module --with-stream_ssl_preread_module"


RUN echo "deb http://ftp.ca.debian.org/debian unstable main" >> /etc/apt/sources.list.d/unstable.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests curl libpcre3 libpcre3-dev gcc+ make libssl-dev autoconf libssl-dev libperl-dev libxslt1-dev libgd-dev libgeoip-dev && \
    curl http://nginx.org/download/nginx-$nginxVersion.tar.gz | tar xz && \
    cd nginx-${nginxVersion} && \
    ./configure ${extrasConfigureFlags} && \
    cd .. && \
    apt-get remove --purge --auto-remove -y curl make autoconf && \
    rm -rf /var/lib/apt/lists/* nginx-${nginxVersion} /etc/apt/sources.list.d/unstable.list

# Define volumes list
VOLUME ["/var/www/html","/etc/nginx/sites-enabled","/etc/nginx/conf.d", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory
WORKDIR /etc/nginx

# Define default cmd
CMD ["nginx","-g","daemon off"]

# Expose HTTP/HTTPS
EXPOSE 80/tcp
EXPOSE 443/tcp
