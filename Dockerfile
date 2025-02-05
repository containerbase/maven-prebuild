FROM ghcr.io/containerbase/base:13.7.8@sha256:53a64e921c789bec807cd34a2568bc276b8f23038484de3278f785948db2d62a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
