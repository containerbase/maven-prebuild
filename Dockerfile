FROM ghcr.io/containerbase/base:14.62.0@sha256:721a1ff0f43c8758a1fe49802179fb3dccf3170325300e78b5b33d51e6b1d409

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
