FROM ghcr.io/containerbase/base:9.33.3@sha256:de45e608beb551797a70f3daeae4229a26160fa608ff55d26276c41c27f54bd8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
