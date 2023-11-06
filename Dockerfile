FROM ghcr.io/containerbase/base:9.23.12@sha256:7200ea0cc7bb19a9d33881a14da2bc0208daf7553cadc0fff084ad158e372c50

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
