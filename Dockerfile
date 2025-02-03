FROM ghcr.io/containerbase/base:13.7.5@sha256:cf716be71cfd908afb59074739938f55857ff9d756665533be3ae61fb29306df

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
