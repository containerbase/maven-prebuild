FROM ghcr.io/containerbase/base:14.0.13@sha256:b2f6a19f3efd11bc5d34cb863b2184f1d06c2c612dcb457eb277ddba402d5d94

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
