FROM ghcr.io/containerbase/base:13.0.8@sha256:ebc3d3599eb148de64b43b6e91eac8217e0f28f555985390ae60b765e779324c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
