FROM ghcr.io/containerbase/base:14.55.2@sha256:d2b5ffe80eebcec4be21a95e7b675f9ef63324e1cf9e791e9ad02c7c944d15a1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
