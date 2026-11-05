FROM ghcr.io/containerbase/base:14.66.2@sha256:5dcdb0aa9e9a0fc33b4ca0f013720b3031ccac36f35f9476f5818f44dd49367c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
