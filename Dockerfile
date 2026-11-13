FROM ghcr.io/containerbase/base:14.66.23@sha256:0af58d0e9f38d3206f8c255b8e0dccc63da0e57474ee251f99e4c07b66d63737

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
