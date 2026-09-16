FROM ghcr.io/containerbase/base:14.16.0@sha256:7d4d528eaa0b4bdb1e0b17e9920d164070d8c7767facd45d6cae3ef7ab608b83

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
