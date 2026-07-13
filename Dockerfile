FROM ghcr.io/containerbase/base:14.12.12@sha256:9b84f2ede8e84b55521a1d193b45a62fccdb6fc3f27495ad0d31ca3402438ba9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
