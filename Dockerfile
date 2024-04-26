FROM ghcr.io/containerbase/base:10.4.0@sha256:01eb3072abc14562afd63fe4251b8fb5ca9ac0f4a41561cd3265d6bd140d17c4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
