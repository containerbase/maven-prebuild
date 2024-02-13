FROM ghcr.io/containerbase/base:10.0.0@sha256:262f9ca471682dbb9be7ba666cf965d05d971745835100ce32c660bfef873b7d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
