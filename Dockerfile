FROM ghcr.io/containerbase/base:14.39.0@sha256:5da5c8171b5a074c0b4fb286481b74a3ca6631fa2dbca179c59d86947f2c5627

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
