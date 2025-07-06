FROM ghcr.io/containerbase/base:13.8.51@sha256:4d0cd999085cd0aab45537b64de4453ec1612e56a5da9ec38be38ecef9ca3f92

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
