FROM ghcr.io/containerbase/base:14.6.6@sha256:8430fc432cd49c6931ecbf36c7a45fdfc127c46228bd91d9feb62a64a5493eb2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
