FROM ghcr.io/containerbase/base:13.8.68@sha256:552acdc1d3aad2f5ffc5d6b3b399cd4eec7f404a28e294fb974b3ad64007749f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
