FROM ghcr.io/containerbase/base:11.1.1@sha256:70c34b6cb30f90c15edb84dadda23f5245b005dc5e97dec774d5e2a2d2e2f454

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
