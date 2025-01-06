FROM ghcr.io/containerbase/base:13.5.8@sha256:61f6a70c919f3be9e22f78039d046cd3443b7a5e09078b7fa0683db3791d8a31

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
