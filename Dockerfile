FROM ghcr.io/containerbase/base:9.23.9@sha256:e89ee56efd1aa7f62bf22ed5468a3ad3c60a11ceb353c252db3019f59cb4ad45

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
