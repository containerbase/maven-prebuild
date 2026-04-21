FROM ghcr.io/containerbase/base:14.7.3@sha256:594cab76fcaa4a237ac27a9a9dc82ab6aee46643c75ec42e74680e93ed3593b9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
