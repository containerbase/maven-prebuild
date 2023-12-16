FROM ghcr.io/containerbase/base:9.30.6@sha256:91b6c89bb3fed8177671b2a1d28ce5eb506ddea748c1a5357fe756c40d177cfe

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
