From centos
RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum install -y bind-utils telnet jq wget git openssl && \
    wget -O /usr/bin/busybox https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox && \
    chmod +x /usr/bin/busybox && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    yum install -y bc && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    yum autoremove -y
CMD ["/bin/bash"]
