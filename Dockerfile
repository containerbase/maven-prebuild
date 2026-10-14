FROM ghcr.io/containerbase/base:14.40.0@sha256:4db7a533e4f362803ab6f3b16beb52f4559bc74416a4120fbbfa60ac8480b979

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
