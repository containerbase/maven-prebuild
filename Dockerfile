FROM ghcr.io/containerbase/base:14.12.3@sha256:36cd44a81d82db066848d769fa94ea07ebfcf2c5a56ec59707907ea3c1ab38e9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
