FROM ghcr.io/containerbase/base:14.6.8@sha256:cf0ea7ce7068b19d2bf9addab60181f4791d932379393f6a92cb3e0ea7953800

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
