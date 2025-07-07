FROM ghcr.io/containerbase/base:13.8.56@sha256:2932ef17af9c0841ae7c80c7d6f959f5f9266bd001c9ee751b7242a6fde257a2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
