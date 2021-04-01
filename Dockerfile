FROM debian:buster

WORKDIR /opt

ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip awscliv2.zip
ADD https://dl.k8s.io/release/v1.18.2/bin/linux/amd64/kubectl kubectl
ADD https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 get_helm.sh

COPY run.sh run.sh

RUN apt-get update && \
    apt-get install -y unzip wget && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws && \
    mv ./kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    chmod +x get_helm.sh && \
    ./get_helm.sh && \
    rm -f get_helm.sh && \
    chmod +x run.sh

ENTRYPOINT ["/opt/run.sh"]
