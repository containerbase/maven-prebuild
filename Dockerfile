FROM ghcr.io/containerbase/base:14.24.0@sha256:6c58ba9f5a53edbc9f12f9ea05d075922120ef51c4579dccbda5c5d64ce6fd83

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
