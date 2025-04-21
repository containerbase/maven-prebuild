FROM ghcr.io/containerbase/base:13.8.15@sha256:45c70a981a75281403a932f0714b8c0b63e0eb9b115b2134e7af05b4e626de83

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
