FROM ghcr.io/containerbase/base:10.3.3@sha256:2229a04d052999d2e46439dd735a7a64ac1b250f82148a2df9338054014dd289

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
