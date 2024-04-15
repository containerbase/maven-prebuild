FROM ghcr.io/containerbase/base:10.3.14@sha256:24e5856a7f867bc9dbc7b1280f2458a732f2a70a8128e034cdbd0f74c2f86452

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
