FROM ghcr.io/containerbase/base:13.23.12@sha256:68be1b25099d8b7f44ef8663f9ec1b4112d2b71fb4a4731384f89ad9e710ab51

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
