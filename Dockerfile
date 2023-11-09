FROM ghcr.io/containerbase/base:9.24.0@sha256:82e02e48136e3d3e5d5d1bafd59acb5dbcfdf72b28f012de71757edeb203fc3d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
