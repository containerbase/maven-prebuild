FROM ghcr.io/containerbase/base:14.18.2@sha256:944b2f62ab268624f3077600909441c69e60f40e78eb69d832ab1d488f54ff00

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
