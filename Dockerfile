FROM ghcr.io/containerbase/base:13.13.10@sha256:6be26bde4603ba6ad99cb72f0d6e07441534affa51c3fc2c6a44b16437d8eb7d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
