FROM ghcr.io/containerbase/base:14.59.3@sha256:4bfafce5c5e3c73e535dd3ba0fad14f316c7bc5d01cb8cfb27d30cdda2d353be

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
