FROM ghcr.io/containerbase/base:13.6.0@sha256:6267974def5184599e5b41c8eb92c6f069b8631c05ce1caeb7312ca579d9669a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
