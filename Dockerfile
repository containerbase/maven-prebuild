FROM ghcr.io/containerbase/base:14.11.2@sha256:2f30a045b55d2f743d63bb916c6ce48d905e69a34619926740cd5261fbdaeadf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
