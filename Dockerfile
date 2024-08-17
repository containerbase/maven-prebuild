FROM ghcr.io/containerbase/base:11.11.4@sha256:0a082adc453fc0d8436c54267b95b76b2e9c4750e0b40c1348d8abd30af71d51

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
