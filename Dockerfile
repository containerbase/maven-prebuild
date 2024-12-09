FROM ghcr.io/containerbase/base:13.2.2@sha256:81866a1af02458da34f20dca704ebfac1ad72232fb33a5683634522403883db9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
