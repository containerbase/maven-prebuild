FROM ghcr.io/containerbase/base:14.66.8@sha256:5cc4b75796c4bee3c62f07912734f74bd48d9fe940898e3bb39da8578f9dbc8a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
