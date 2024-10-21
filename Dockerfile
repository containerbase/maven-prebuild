FROM ghcr.io/containerbase/base:12.0.10@sha256:30b853b224d0c644371c30de69ddde13edf6077376c8b17d48633d94be5b7c38

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
