FROM ghcr.io/containerbase/base:10.15.2@sha256:0d11770eb8dadf082bfcec1a0e151f4993fb088808d42c83913e1080997a327f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
