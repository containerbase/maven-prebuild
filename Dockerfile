FROM ghcr.io/containerbase/base:13.25.3@sha256:936e07abbc9b4c6e28c010f70aa63b25b41c214c7f185d4deb1bb1e2cfce390d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
