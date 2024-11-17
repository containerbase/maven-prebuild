FROM ghcr.io/containerbase/base:13.0.17@sha256:be0dbb12d8187b105d5ed5799fbb5ae1d9f0014380ec71e96fda4b9eb1fc67eb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
