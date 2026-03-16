FROM ghcr.io/containerbase/base:14.6.3@sha256:2a059ec3a136722ae17364483a108c3ceb201ce13c06777b948b0fea4ca65045

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
