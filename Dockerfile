FROM ghcr.io/containerbase/base:13.10.21@sha256:19e1caafaa0c8f61f1c7cc65581cb16f8335af12f40ef1e47dff06958bbbabfb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
