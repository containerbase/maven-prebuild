FROM ghcr.io/containerbase/base:9.33.5@sha256:4167fc9f60bffd61245f83a69f5a049f0c919c58742eedba58e10d382aaecd38

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
