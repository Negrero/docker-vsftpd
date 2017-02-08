FROM registry.ng.bluemix.net/ibmnode:latest

# ##################################################
# ####         vsftpd                            ###
# ####  https://github.com/panubo/docker-vsftpd  ###
# ##################################################

RUN groupadd -g 1100 ftp && \
    useradd --no-create-home --home-dir /srv/ftp -s /bin/bash --uid 1100 --gid 1100 -c 'ftp daemon' ftp

RUN groupadd -g 1200 strong-pm \
    && useradd -ms /bin/bash --uid 1200 --gid 1200 strong-pm 

RUN apt-get update \
    && apt-get install -y --no-install-recommends vsftpd db5.3-util whois \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty /etc/vsftpd/user_conf /var/ftp /srv/ftp && \
    touch /var/log/vsftpd.log && \
    rm -rf /srv/ftp/ftp 
RUN chown -R ftp /etc/vsftpd

COPY vsftpd/vsftpd*.conf /etc/ 
COPY vsftpd/vsftpd_virtual /etc/pam.d/ 
COPY vsftpd/*.sh /

ENV FTP_USER user
ENV FTP_PASSWORD 123
ENV FTP_USERS_ROOT true
# Expose ports and container starting point
EXPOSE 21 4559 4560 4561 4562 4563 4564
ENTRYPOINT ["/entry.sh"]
CMD ["vsftpd"]

