FROM ghcr.io/containerbase/base:12.0.2@sha256:788939a46f861fb70060d7ec62574447c12e8eb2cf35c6e2314d43ad19208f61

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
