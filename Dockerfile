FROM ghcr.io/containerbase/base:14.6.4@sha256:3f29ae0ba7eee08ee4ed5e21f8445c3e48193fc1e55714cadbea0ca3d03f9131

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
