FROM ghcr.io/containerbase/base:9.33.7@sha256:bcdfe116322f1cc0213ac4293385b080243f247928ce77f160f4c04a87e24f77

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
