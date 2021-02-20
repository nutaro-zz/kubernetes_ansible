FROM ubuntu:focal

USER root

RUN apt update -y
RUN apt upgrade -y
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install curl gnupg2 build-essential apt-transport-https software-properties-common \
    ca-certificates gnupg-agent -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"
RUN apt update -y
RUN apt upgrade -y
RUN apt install docker-ce docker-ce-cli containerd.io -y
RUN apt install kubelet kubeadm kubectl -y
RUN apt-mark hold kubelet kubeadm kubectl


