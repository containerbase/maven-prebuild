FROM ghcr.io/containerbase/base:14.13.1@sha256:b66460afbf18d97ccecac8f193e183eb3e8b3918ccbbe3396706d5d364dfbcb1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
