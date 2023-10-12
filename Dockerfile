FROM ghcr.io/containerbase/base:9.21.0@sha256:9d3b42635085228314be392094bdd1a18218036a61bea3a9c87002f48a2d6295

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
