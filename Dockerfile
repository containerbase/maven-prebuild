FROM ghcr.io/containerbase/base:14.35.0@sha256:aa4760c4d8f0407d740452e0637550596ad2254c29ef4b3da8f5f8867e22d947

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
