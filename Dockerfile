FROM ghcr.io/containerbase/base:14.52.4@sha256:778947b28ff0fccecc202b5ca6dbac0a95c3bde6bc9a4e915e6ef5f7d7fa9d0c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
