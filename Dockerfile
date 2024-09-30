FROM ghcr.io/containerbase/base:11.11.27@sha256:14d8b62ccd92c1e0e6ffd2cb58d825d6c64d33323c5fc0732dc67d21968fd34b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
