FROM ghcr.io/containerbase/base:14.69.0@sha256:b48f6446f4cabd3e2f9b13a96330ad332811d3aa0053e9ab4d568f7e7d2f37fb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
