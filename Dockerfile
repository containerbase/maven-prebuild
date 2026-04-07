FROM ghcr.io/containerbase/base:14.6.15@sha256:1f64cc9800aa391f863351b26e2365b395a7db937bef270aed09e0583860cc07

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
