FROM ghcr.io/containerbase/base:9.30.4@sha256:6483f596589d37c7c305ea0b3d93a6762d6255cd9b19d4b1aa62b4f461ea4364

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
