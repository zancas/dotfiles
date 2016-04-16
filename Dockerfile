From debian:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get remove -qq --purge nano
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tmux
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mtr
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ipython
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip
ADD . /root/
ADD ./devenv /root/devenv
WORKDIR /root/devenv
EXPOSE 22
