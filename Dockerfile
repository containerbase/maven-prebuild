FROM ghcr.io/containerbase/base:13.7.15@sha256:e54355bd55fbc521cbec1d000a57c69649fec92400b00e8b9d82ba2839c9b790

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
