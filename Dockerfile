FROM ghcr.io/containerbase/base:13.24.1@sha256:e9a158665928a0823f197e941f06338bf479c41a7f843757f092e7e56f2a4bec

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
