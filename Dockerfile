FROM centos:7

# yum install openssh* wget bzip2 unzip gzip git sudo hostname procps gcc-c++ -y ; \
# yum install pangox-compat -y ; \
# yum upgrade glibc -y; \
RUN yum update -y ; \
    yum install epel-release -y ; \
    yum install openssh* sudo -y ; \
    yum install NetworkManager-openconnect net-tools which nmap-ncat -y; \
    yum clean all

# SSH service start
# echo 'root:youjumpijump' | chpasswd ; \
RUN ssh-keygen -A ; \
    mkdir -p /var/run/sshd ; \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# SSH service end

COPY resource/authorized_keys /root/.ssh/authorized_keys

RUN chmod 0600 /root/.ssh && chmod 0600 /root/.ssh/authorized_keys

COPY entrypoint.sh /


CMD [ "/entrypoint.sh" ]
