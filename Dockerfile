FROM ghcr.io/containerbase/base:14.66.17@sha256:e1a9ffc20ff2599ce60402010eb131058812fb60bca5f150eacca1f66a6bea81

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
