FROM ghcr.io/containerbase/base:13.23.5@sha256:281c8e901db51dc075abab84cccade455e12fe352aba315aecb32cd8ff1521c6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
