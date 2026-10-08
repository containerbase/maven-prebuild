FROM ghcr.io/containerbase/base:14.29.1@sha256:6596d3e9d5655acc013f4b2c7bcb1c390281ccd230343de370fe8b206399f14d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
