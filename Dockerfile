FROM ghcr.io/containerbase/base:10.11.8@sha256:f5a6e43f69f66bfe29e0a55e10f7211676e5afd2948ab68943851cfca234d58d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
