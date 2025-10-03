FROM ghcr.io/containerbase/base:13.14.8@sha256:569b7e3dbf2e53c536930877c12af394f594127f1c9353f4d7f437b17ec774fd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
