FROM ghcr.io/containerbase/base:9.31.5@sha256:c36d6ec3560dddd93c37320af6288cd6da4923026eb667d0ceb64fbb78e79faf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
