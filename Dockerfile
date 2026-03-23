FROM ghcr.io/containerbase/base:14.6.7@sha256:a610daced307d8c7e08293998ff6e661317630a75b27f4da08a0799db4d6a555

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
