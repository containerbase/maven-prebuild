FROM ghcr.io/containerbase/base:14.31.1@sha256:856053a1c88370f9ccd3d96819d5c999d7fccc612a4c7748b7e3462c9d13d398

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
