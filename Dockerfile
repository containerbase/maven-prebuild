FROM ghcr.io/containerbase/base:14.13.9@sha256:0cc5d32866fb7a64a014fc79ae907ae252444a08e87c28122a6d11296ac14128

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
