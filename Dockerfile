FROM ghcr.io/containerbase/base:10.2.2@sha256:0b4ecadf84d0a9cd3ace806c056b646859ed827e32749d1b785b851a9411b71c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
