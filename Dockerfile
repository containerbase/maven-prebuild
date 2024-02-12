FROM ghcr.io/containerbase/base:9.33.9@sha256:d404446d1f6a87d8c4369e47115ef701a9e35d653ce0b8f5c03b34778febcbc5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
