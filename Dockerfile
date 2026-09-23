FROM ghcr.io/containerbase/base:14.17.1@sha256:42c534d20ff87db146473a78f17f618dc24a40fabfed8daa5701557c6e3d00a9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
