FROM ubuntu:focal

RUN apt update -y
RUN apt upgrade -y
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install curl gnupg2 build-essential apt-transport-https software-properties-common -y
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"
RUN apt update -y
RUN apt upgrade -y
RUN apt install kubelet kubeadm kubectl -y
RUN apt-mark hold kubelet kubeadm kubectl


