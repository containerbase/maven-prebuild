FROM ghcr.io/containerbase/base:14.12.2@sha256:7c501a9a0597b64a244755aa3009325f5992863ce5885acdefe7d2985d59e5f9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
