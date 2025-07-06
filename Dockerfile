FROM ghcr.io/containerbase/base:13.8.52@sha256:a77ff546359430da174457c545a4e29e04408fe88bb4500be85797ef11767559

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
