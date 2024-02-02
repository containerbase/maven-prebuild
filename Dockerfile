FROM ghcr.io/containerbase/base:9.32.2@sha256:811216121107ca6173ae10eb52b25bce064da108204aada7c2d1b86dbcc3f477

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
