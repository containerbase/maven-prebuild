FROM ghcr.io/containerbase/base:9.30.2@sha256:6b5db7e17cb682281117e70d80a2fffa073a45bf8cdbbe5b8c2ad9872ce0ef9f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
