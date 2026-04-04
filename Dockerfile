FROM ghcr.io/containerbase/base:14.6.10@sha256:2894656e603a20d3ad70e3f167b47b1b6b5b6b8df6c63aec6023790a6a5a779b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
