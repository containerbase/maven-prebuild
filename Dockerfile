FROM ghcr.io/containerbase/base:13.14.9@sha256:9b745e6d5ef249d3b42b0dd61993254599a395b2e3deab397708eccc86ae4e4b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
