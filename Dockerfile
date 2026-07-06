FROM ghcr.io/containerbase/base:14.12.5@sha256:66bb4a6cd02fd923bc15c330a62efb1b78c433c83dd425b40f6aace06c249d13

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
