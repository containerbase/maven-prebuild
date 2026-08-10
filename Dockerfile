FROM ghcr.io/containerbase/base:14.14.0@sha256:24c1db35e10fdda5a3d851613b8a74f772fd96eb84a451aec5a5283ec643bc99

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
