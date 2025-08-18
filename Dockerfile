FROM ghcr.io/containerbase/base:13.10.3@sha256:82cc486a06f7734833359962355d6a318e2776cc09ca62312d7e12be3cbd686b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
