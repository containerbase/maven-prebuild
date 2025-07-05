FROM ghcr.io/containerbase/base:13.8.49@sha256:0da349058b0a754d2871e8084495458a3f316fc13594c71000993e2524f954ed

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
