FROM ghcr.io/containerbase/base:13.7.19@sha256:d7b424f58b6a62690bccb23e3abf451f938e4cd0486e7d6b820095d84c05c4a5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
