FROM ghcr.io/containerbase/base:13.23.19@sha256:b54393c9a6841c22a50740dc082d9b5719491d23cfc9626a8d12978282e4f812

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
