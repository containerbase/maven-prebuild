FROM ghcr.io/containerbase/base:10.11.2@sha256:96d88c92cd58d250b444f94fa1797d22c2999378f941c27265463a4ebb68c690

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
