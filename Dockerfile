FROM ghcr.io/containerbase/base:10.1.0@sha256:ee1e5baf1e7abbe0e3e584f449676d109d7bc3d6c3f4226391e8a818d63455d5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
