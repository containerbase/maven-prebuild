FROM ghcr.io/containerbase/base:9.23.7@sha256:7f48bd13d463909affcf65769692f39f307e3bd4865b24daa87362ea95be9be8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
