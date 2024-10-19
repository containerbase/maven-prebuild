FROM ghcr.io/containerbase/base:12.0.8@sha256:4c972bdc114bd049c41ac7ecbf5f50d19d4a202f7837bf2f0b5b6a3bae7ff407

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
