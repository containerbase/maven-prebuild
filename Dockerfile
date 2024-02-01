FROM ghcr.io/containerbase/base:9.32.1@sha256:26f9e37afc8213cb9a5b090384c6a583efdffe3d2474c85c3a4e692bbfa6618e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
