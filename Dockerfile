FROM ghcr.io/containerbase/base:13.8.14@sha256:ff57d05ee75a288878b9be45e9d27d478b2a14ed485ca96b359339e8bd9001c8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
