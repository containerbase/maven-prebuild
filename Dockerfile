FROM ghcr.io/containerbase/base:11.11.24@sha256:56cb52f2c3d4759dbc4143bc3e7233f7d5fc8cca627e90168d6c06e2d745a559

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
