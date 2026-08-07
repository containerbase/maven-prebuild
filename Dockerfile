FROM ghcr.io/containerbase/base:14.13.15@sha256:153abaca3bfc55207821624a8f17507b026e4fd532eee6707d3e30552ee29d10

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
