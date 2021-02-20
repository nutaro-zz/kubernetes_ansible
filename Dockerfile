FROM ubuntu:focal


RUN apt update -y
RUN apt upgrade -y
RUN apt install apt-transport-https curl vim gnupg2 -y
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list \
deb https://apt.kubernetes.io/ kubernetes-xenial main\
EOF\
RUN apt update
RUN apt install kubelet kubeadm kubectl -y
