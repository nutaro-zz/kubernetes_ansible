FROM ubuntu:focal

RUN apt update -y
RUN apt upgrade -y
RUN apt install curl -y
RUN curl -LO "https://dl.k8s.io/release/v1.20.4/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/release/v1.20.4/bin/linux/amd64/kubectl.sha256"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
