FROM docker:stable
MAINTAINER Peter Wiggers <peter@bitlayer.nl>

RUN apk add --update python

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-201.0.0-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-201.0.0-linux-x86_64.tar.gz && \
    /google-cloud-sdk/install.sh -q && \
    ln -s /google-cloud-sdk/bin/gcloud /usr/local/bin && \
    gcloud --version && \
    rm google-cloud-sdk-201.0.0-linux-x86_64.tar.gz

RUN gcloud components install docker-credential-gcr --quiet
