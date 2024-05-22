FROM ghcr.io/containerbase/base:10.6.14@sha256:b6002ebc28117d34b49322955d2cff49745363012d36930ab739f3ec7575947a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
