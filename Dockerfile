FROM ghcr.io/containerbase/base:14.66.10@sha256:495eef9b32c6c3c9141e4ef12779d12bd388489d2e20cabc467b867dc2c783b0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
