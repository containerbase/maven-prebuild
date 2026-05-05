FROM ghcr.io/containerbase/base:14.9.6@sha256:fe182d00917eaea1c7ad7baabd603a6fd8ae22f5615dcfb3756ffde08dc2335d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
