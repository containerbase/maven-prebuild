FROM ghcr.io/containerbase/base:14.9.1@sha256:e5a8b39317e4afc6af1f375d598d3766969c9cf2987abb800b90a5169c7e2938

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
