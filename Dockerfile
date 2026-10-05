FROM ghcr.io/containerbase/base:14.25.0@sha256:1590091a3e73a1390c40351ac4442078fe591981957713f70fe45c6bbdee1c1d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
