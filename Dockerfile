FROM ghcr.io/containerbase/base:13.8.27@sha256:dd439ff198510680e3074bc47f2615ed21cc42932c57d38c160491bd0c62b28c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
