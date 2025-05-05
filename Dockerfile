FROM ghcr.io/containerbase/base:13.8.19@sha256:9281238e473eac08507992ad297d02fc597c42a9db9aec800a5088772efcae69

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
