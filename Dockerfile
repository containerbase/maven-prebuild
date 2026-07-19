FROM ghcr.io/containerbase/base:14.13.7@sha256:2a0d91167dd047ffdea4be0965dc67fcfb152d6f53a9d346d4c04a5eccd3af86

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
