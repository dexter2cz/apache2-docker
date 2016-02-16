FROM debian:jessie
MAINTAINER Dex <dextor@civ.zcu.cz>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		libapache2-mod-webauth \
		ca-certificates \
	&& rm -r /var/lib/apt/lists/* \
	&& apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /usr/sbin/a2enmod ssl
RUN /usr/sbin/a2enmod headers
RUN /usr/sbin/a2enmod proxy_http
RUN /usr/sbin/a2enmod rewrite

EXPOSE 80 443

COPY start.sh /

CMD ["/start.sh"]
