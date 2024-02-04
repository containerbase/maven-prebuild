FROM ghcr.io/containerbase/base:9.33.1@sha256:e1edd49ae6bcc6c468600436eed78db6739624f6d892c2bf4c312d03fb732bf9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
