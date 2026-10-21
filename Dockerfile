FROM ghcr.io/containerbase/base:14.47.0@sha256:6b2e8030d47d66a212c8481298c652e62a2af718c79822ab244eb0103ad5ded7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
