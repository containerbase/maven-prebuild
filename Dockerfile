FROM ghcr.io/containerbase/base:14.1.0@sha256:d66d8ebc1cb5ad0ca126436a6e670c6eff7fb25a5db2fef78683c349e515390e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
