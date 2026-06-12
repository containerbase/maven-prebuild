FROM ghcr.io/containerbase/base:14.11.0@sha256:f910b3c136362c69a7b39ea3826c8bbf66eb37d297d2a8bc6467c77defc2cc13

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
