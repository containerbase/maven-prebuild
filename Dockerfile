FROM ghcr.io/containerbase/base:13.10.8@sha256:1a46c3947e796fbd1d93e93b15fe6d653d43cc60587182f333a69a0e76ae1fcc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
