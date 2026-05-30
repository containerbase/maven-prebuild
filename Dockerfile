FROM ghcr.io/containerbase/base:14.10.21@sha256:4cf92f44244a0e448c9d1579a5d199e6e0c773d233cd6c00513e3448d7cb8fe9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
