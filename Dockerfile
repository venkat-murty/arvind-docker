FROM cs225
MAINTAINER Venkat Murty <venkat.murty@gmail.com>


RUN  DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install --yes --no-install-recommends \
    sudo openssh-server vim gdb

RUN mkdir /var/run/sshd

RUN mkdir -p /etc/sudoers.d
RUN echo '%users ALL=(ALL) ALL' > /etc/sudoers.d/users

# Let root login
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

COPY bashrc /tmp/bashrc
COPY vimrc /tmp/vimrc
COPY users /tmp/users
COPY create_users.sh /tmp/create_users.sh
WORKDIR /tmp
RUN bash create_users.sh && rm /tmp/create_users.sh

# SSH port
RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
