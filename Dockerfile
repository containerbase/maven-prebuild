FROM ghcr.io/containerbase/base:13.19.0@sha256:7fd860079f3e0f2a2421b93184487364db614ff48124861dd6110b5afc68de9c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
