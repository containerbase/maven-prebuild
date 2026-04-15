FROM ghcr.io/containerbase/base:14.6.21@sha256:994ad45621589b8a96711db8a5dcaddae8d0d17931780c99bcdf65ba16dbe443

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
