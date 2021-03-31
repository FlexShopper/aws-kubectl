FROM debian:buster

ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip awscliv2.zip
ADD https://dl.k8s.io/release/v1.18.2/bin/linux/amd64/kubectl kubectl

RUN apt-get update && \
    apt-get install -y unzip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws && \
    mv ./kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
