FROM oraclelinux:latest

# Install server
RUN yum -y install httpd \
  && rm -rf /var/cache/yum/*

RUN [ -d /var/log/httpd ] || mkdir /var/log/httpd
RUN [ -d /var/run/httpd ] || mkdir /var/run/httpd
RUN [ -d /var/lock/httpd ] || mkdir /var/lock/httpd

RUN chown -R apache:apache /var/log/httpd

ENV APACHE_RUN_USER apache
ENV APACHE_RUN_GROUP apache
ENV APACHE_LOG_DIR /var/log/httpd
ENV APACHE_LOCK_DIR /var/lock/httpd
ENV APACHE_RUN_DIR /var/run/httpd
ENV APACHE_PID_FILE /var/run/httpd/httpd.pid

VOLUME /var/log/httpd

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

