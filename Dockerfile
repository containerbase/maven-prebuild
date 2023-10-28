FROM ghcr.io/containerbase/base:9.23.8@sha256:c55f74e486fa74dde672f971b8025a13c4119bdda177363cfca600595a900117

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
