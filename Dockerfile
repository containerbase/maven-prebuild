FROM ghcr.io/containerbase/base:13.8.6@sha256:bc2b203b2193ba7de7df5424f8275afd5ee35fb134f1add80c6794bebada177f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
