FROM ghcr.io/containerbase/base:12.0.0@sha256:5f93be4c2039970faf2d6dee0c059caafb81519f13b147007999032a34fceaee

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
