FROM ghcr.io/containerbase/base:14.66.15@sha256:d631f79acd0d39b3b5982afb620b3fc53d0be98fe91cb7302c1db05e977dd6f8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
