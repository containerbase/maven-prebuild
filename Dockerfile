FROM ghcr.io/containerbase/base:9.23.13@sha256:d14b5f27fae55a2a016a2ddd116508d95fbb4269d85f845a6ede57f342265014

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
