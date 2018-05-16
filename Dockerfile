FROM docker:stable
MAINTAINER Peter Wiggers <peter@bitlayer.nl>

ENV SDK_VERSION="201.0.0"

RUN apk add --update python

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    /google-cloud-sdk/install.sh -q && \
    ln -s /google-cloud-sdk/bin/* /usr/local/bin && \
    gcloud --version && \
    rm google-cloud-sdk-201.0.0-linux-x86_64.tar.gz

RUN gcloud components install docker-credential-gcr --quiet
