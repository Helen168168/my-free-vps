Do# 示例1：最简单的 SSH 远程服务器（最常用）
FROM ubuntu:24.04
RUN apt update && apt install -y openssh-server curl wget nano htop && \
    mkdir -p /var/run/sshd && \
    echo 'root:12345678' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
