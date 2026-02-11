FROM ghcr.io/containerbase/base:14.0.11@sha256:659d6b527e901c143e0787c78d2faa102b611bb27788acaf063cc427e400d3fe

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
