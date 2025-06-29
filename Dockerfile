FROM ghcr.io/containerbase/base:13.8.45@sha256:229f1eb2c28a19db071876e68402b550721faaeb92252e35a816e97328dca511

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
