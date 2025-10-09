FROM ghcr.io/containerbase/base:13.18.2@sha256:0e415159aaf15a0f4b5809a7b233f5e462c4558e021d345f479ab350c459df34

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
