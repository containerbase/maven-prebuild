FROM ghcr.io/containerbase/base:13.25.10@sha256:a9c0fae09ce598aedf3a8105269ec74dad276e842ac1dba6b62e4ac4d7cb9e3f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
