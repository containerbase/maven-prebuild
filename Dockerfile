FROM ghcr.io/containerbase/base:13.14.5@sha256:692c8a12e149481f214b5591e4a21af1433f853aa7e0f25559abca6d1d852d8d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
