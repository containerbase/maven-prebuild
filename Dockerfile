FROM ghcr.io/containerbase/base:9.30.8@sha256:0a2feda2c7e19223589d68cc034d4d473ffecb136a88547ffa3f1a708189cbb7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
