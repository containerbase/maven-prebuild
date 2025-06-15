FROM ghcr.io/containerbase/base:13.8.40@sha256:9556928ac9b00456572b549c1f870e771e1bf244649bf4d2110a16b0bbd2b7b5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
