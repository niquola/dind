FROM ubuntu:14.04
MAINTAINER niquola

RUN apt-get -qq update
RUN sudo apt-get update
RUN apt-get -qqy install docker.io iptables ca-certificates lxc
RUN ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
VOLUME /var/lib/docker

RUN useradd -d /home/dev -m -s /bin/bash dev && echo "dev:dev"|chpasswd && adduser dev sudo

RUN echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER dev
ENV HOME /home/dev
env PATH /home/dev/bin:$PATH

RUN sudo apt-get install -qq -y tmux zsh
RUN cd ~/ && git clone https://github.com/niquola/dotfiles
RUN cd ~/dotfiles && bash install.sh
