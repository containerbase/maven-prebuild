FROM ghcr.io/containerbase/base:9.23.11@sha256:1c0284d0dac8e024177da0bd01dd514c53db0a5fc9385d8688878a77164e645d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
