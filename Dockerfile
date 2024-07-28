FROM ghcr.io/containerbase/base:11.1.5@sha256:f4b16983d7f46d5ecd205f0ff684dbd251a292b5fb2bc5ae9189baf00995bc9c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
