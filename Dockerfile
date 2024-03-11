FROM ghcr.io/containerbase/base:10.2.6@sha256:bfaa277ebb8e51fe33167250c55dc857fbf929916457e3559676ee0416cda162

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
