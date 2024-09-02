FROM ghcr.io/containerbase/base:11.11.9@sha256:a7101cc6aefc500f72d990ace17539c6f3ce17dd236d762992bfcd5b246d1f3d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
