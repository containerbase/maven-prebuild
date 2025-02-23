FROM ghcr.io/containerbase/base:13.7.18@sha256:76a6046635887b05412d17395c2472636805e0d63aca754acb3437c35bb49f7f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
