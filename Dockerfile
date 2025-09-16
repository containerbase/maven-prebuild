FROM ghcr.io/containerbase/base:13.13.4@sha256:ff4900ce492d2ff933ed26948744aeac575c8441dcaba035cd57ec6626b5d036

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
