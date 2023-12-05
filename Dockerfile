FROM ghcr.io/containerbase/base:9.28.0@sha256:6273193cb55945e8d7a9154829497584558094cc9e11481fd48c41dfc8920325

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
