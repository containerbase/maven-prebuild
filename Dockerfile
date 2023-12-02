FROM ghcr.io/containerbase/base:9.26.1@sha256:97e5b9377cc6a258ee73be209fc10576d00c10d57cd3d0689b1f8cd4a4b37d57

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
