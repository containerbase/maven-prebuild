FROM ghcr.io/containerbase/base:13.14.6@sha256:380bc83ea4cfe824ef1296f9400bb861e7065a1f89c9372ed7df743699d8ca1d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
