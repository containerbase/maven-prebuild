FROM ghcr.io/containerbase/base:13.7.0@sha256:d07beeac908f2dc61274b1f563daaec1896753a18886361cc2beafd51857c919

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
