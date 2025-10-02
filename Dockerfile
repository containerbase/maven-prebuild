FROM ghcr.io/containerbase/base:13.14.7@sha256:6897c20b12c0fd277fc8bfef2275ca4ebef20baa8f3802cc017f240cb9abfd26

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
