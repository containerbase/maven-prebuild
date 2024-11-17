FROM ghcr.io/containerbase/base:13.0.20@sha256:50ec77fcca858e7a706e99ea64185fb357505e3614fed09c68b3c347bbeba7f5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
