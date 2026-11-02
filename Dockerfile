FROM ghcr.io/containerbase/base:14.59.7@sha256:b2ff06032e91a9b79dd5761b3a4f1d68aba38c8d6a935a38e7422ffe72435037

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
