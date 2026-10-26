FROM ghcr.io/containerbase/base:14.52.6@sha256:bbc6d790fec3f79f338d7dc63053167c01154129bcfa6e9419ab0684ff25465a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
