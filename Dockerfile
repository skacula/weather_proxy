FROM nginx:1.21.6-alpine-perl

RUN apk add --no-cache nginx-mod-http-perl
COPY conf/nginx.conf /etc/nginx
COPY conf/default.conf /etc/nginx/conf.d
RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx
CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]