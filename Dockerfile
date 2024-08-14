FROM ghcr.io/containerbase/base:11.11.0@sha256:ca03a334e8e3959e72e63f9a5860f98c564955be52ce66be764ebe81d4127fc2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
