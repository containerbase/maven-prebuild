FROM ghcr.io/containerbase/base:11.11.22@sha256:4422c78de9cda2e54a1c4972818dd8dd988bab7b89a6c9f7fed9381f7efdd1d7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
