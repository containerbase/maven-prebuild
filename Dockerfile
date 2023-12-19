FROM ghcr.io/containerbase/base:9.30.7@sha256:4cd023ec1e63d5c374daff3066a33dd9f6daf3aa68ed54350687b07985db4c33

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
