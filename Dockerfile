FROM docker:18-dind
MAINTAINER Peter Wiggers <peter@bitlayer.nl>

ENV SDK_VERSION="201.0.0"

RUN apk add --update python make

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    /google-cloud-sdk/install.sh -q && \
    ln -s /google-cloud-sdk/bin/* /usr/local/bin && \
    gcloud --version && \
    rm google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz
