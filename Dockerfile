# Credit major@newsmth Dec 31, 2020

# Install required packages
RUN yum -y install httpd php php-gd php-xml zlib openssl gmp gd libesmtp php-mysql

# Expose web & sshbbsd & bbsd
EXPOSE 22 23 80

# Define data volumes
VOLUME ["/var/log/httpd", "/data/service/bbs"]

# Copy assets
COPY wrapper /sbin/

# healthy check
HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://localhost:80 || exit 1

# Wrapper to handle signal, trigger runit and reconfigure GitLab
CMD ["/sbin/wrapper"]

