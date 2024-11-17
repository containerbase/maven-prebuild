FROM ghcr.io/containerbase/base:13.0.19@sha256:fa8324235801784d83c19b3caafa5aabff9e2a74894123dc1b3617a97d9fe521

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
