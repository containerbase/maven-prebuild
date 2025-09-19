FROM ghcr.io/containerbase/base:13.13.8@sha256:954dc672875f4abe7f8f70bf0d35bc1f2e705eb3539969a27f51f7bbf75af64f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
