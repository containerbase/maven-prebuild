FROM ghcr.io/containerbase/base:11.11.18@sha256:1fee4f92a7a5d34bcd867904085da11f53354f05cb456004195523695dea182b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
