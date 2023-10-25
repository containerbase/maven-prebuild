FROM ghcr.io/containerbase/base:9.23.6@sha256:7eb71b5bcc0d67e1a60d8585895eab75b2ab131d9502331234feb458e82b09a5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
