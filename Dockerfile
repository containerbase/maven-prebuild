FROM ghcr.io/containerbase/base:10.3.17@sha256:3f58afc059846298e401ec47007917df284a163e653114ffc2b3b8749e95095a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
