FROM ghcr.io/containerbase/base:9.29.0@sha256:181b7feb719da85a2f65653566b3947702365f0115dc3eb8ebfe12051e7cebb8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
