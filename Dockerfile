FROM ghcr.io/containerbase/base:11.11.26@sha256:61fbccbf584bf2f10f5640598fb710c500a2b0d4e723ec2591252d5a279d3f85

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
