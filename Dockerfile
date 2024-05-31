FROM ghcr.io/containerbase/base:10.7.0@sha256:b96aa33a0df3720b247f496fa2654fb9739f686da46d96c89ee03fd1dc3bd682

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
