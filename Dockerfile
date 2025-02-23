FROM ghcr.io/containerbase/base:13.7.17@sha256:2b33d4d0e8ce781f0cc58772dcb2423d3a250e6268c0394e72bbd161d3b5326e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
