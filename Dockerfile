FROM ghcr.io/containerbase/base:14.7.2@sha256:dee83a089008fd01ca62ca70701e5887e42faecaea89340571c620b3bc1c862c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
