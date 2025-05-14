FROM ghcr.io/containerbase/base:13.8.26@sha256:e93481ddd75828744f2b69c0783a14999b263dcf78915f2639867e055a87eab7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
