FROM ghcr.io/containerbase/base:13.8.58@sha256:d43040df2900da38d2b925a0f398248add0a33b973169459cedea80505fd0bbb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
