FROM ghcr.io/containerbase/base:13.10.6@sha256:3c92d5b9abe872724f9876eef4a4643d7c4f8751611e55fd870e98a2da164a64

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
