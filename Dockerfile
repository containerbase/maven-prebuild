FROM ghcr.io/containerbase/base:10.15.3@sha256:37567978df0d946a1d9fd355bc9cc2317bea3f8158c637c8e8d4ef42a9d34af9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
