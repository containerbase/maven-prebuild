FROM ghcr.io/containerbase/base:13.23.2@sha256:2a0470066e3082770b8cc3e0307271560aabb25ce2f426be341c37c1fe525349

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
