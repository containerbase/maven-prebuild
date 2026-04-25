FROM ghcr.io/containerbase/base:14.9.3@sha256:ff83565e46ce10feb84a2ecc620a3fc7348692f98ef2029019944dc0c6d55d7f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
