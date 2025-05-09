FROM ghcr.io/containerbase/base:13.8.24@sha256:94397043fe1448235e00d481678bb1375974a68453ee173eaf21547d660cd0c6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
