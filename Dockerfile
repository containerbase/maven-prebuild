FROM ghcr.io/containerbase/base:13.8.2@sha256:e6aeaa7749e3668d00c9ebbf87de9b3b03bceb636cf22662690cb041cf931e02

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
