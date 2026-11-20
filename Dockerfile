FROM ghcr.io/containerbase/base:14.68.2@sha256:a78da54a185fa9ee862c92fca2cfe502aa94f615af0f40c34d50ba4ad818dec7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
