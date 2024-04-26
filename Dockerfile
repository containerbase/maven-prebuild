FROM ghcr.io/containerbase/base:10.3.19@sha256:b7239f4e3e1f3266507048af2d75674d917ada2853365faf2ffe999a094fd999

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
