FROM ghcr.io/containerbase/base:9.32.0@sha256:d052b5122bdb61d2f2b59dd536a7ad4e67a369bb7529ff174f0f267c2304a42f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
