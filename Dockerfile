FROM ghcr.io/containerbase/base:14.4.2@sha256:433f589c69ccec80f503161a786df2c45f6247c36a8f8534f845b5bd37c29e1d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
