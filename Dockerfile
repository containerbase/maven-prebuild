FROM ghcr.io/containerbase/base:13.8.28@sha256:bb610fd705e4578d455a9abebea565c10b4a5d8bf629cb7306a165921cc8a55f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
