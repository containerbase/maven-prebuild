FROM ghcr.io/containerbase/base:10.12.0@sha256:e23e8635f58ec2f8d9f8176ab065f6563920c263828c17d27aa00199612f6cb3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
