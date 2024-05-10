FROM ghcr.io/containerbase/base:10.6.7@sha256:22999ddc3c1ae02ec2c12d15500063dfb9b008ce2d819a2ac22b8cb866e5cd73

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
