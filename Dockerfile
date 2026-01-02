FROM ghcr.io/containerbase/base:13.25.20@sha256:c5e6329f3495c5921d6ca9c0888cd5aa334ef6c7b92cacf994bfc0bfb2ecefb0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
