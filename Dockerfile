FROM ghcr.io/containerbase/base:14.9.4@sha256:e7163335fccb8825596664248137c6640d8ae086f5dbf8fe5b827dd96f763330

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
