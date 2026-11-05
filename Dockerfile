FROM ghcr.io/containerbase/base:14.66.3@sha256:6c50d1895463718c843fd5d8a9d24ac343159e9f64d56541add639b7147eb4bd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
