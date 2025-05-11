FROM ghcr.io/containerbase/base:13.8.25@sha256:5b86523557958759ea2b0878607cede6da6c5912b79f6f3acece4bc0ff214fa9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
