FROM ghcr.io/containerbase/base:10.16.0@sha256:b039aa654299e4d6d17e1fe0f868a659b9aaf88adb08a2745279b48a3af8e268

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
