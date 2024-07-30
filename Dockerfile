FROM ghcr.io/containerbase/base:11.5.0@sha256:0009a535656ec8b5ac7715e272d70aab81f3c85479cb8948621709cede31dcc0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
