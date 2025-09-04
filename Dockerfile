FROM ghcr.io/containerbase/base:13.10.15@sha256:0b643f9332464ab8203bb68512fbe1d7958cbe42b1919f6c0bdaa839121261a6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
