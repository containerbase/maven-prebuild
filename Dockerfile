FROM ghcr.io/containerbase/base:13.17.1@sha256:f95b0fdfcd6ed2b90291be5ce97547ed005f6084d60784f7faeb3eb95f9873ed

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
