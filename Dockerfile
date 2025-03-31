FROM ghcr.io/containerbase/base:13.8.9@sha256:41b3e7db52a4f638d0f6c9241844d55dcaac465eed951b6e44c72edddeab780b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
