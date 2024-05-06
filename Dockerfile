FROM ghcr.io/containerbase/base:10.6.4@sha256:95e3c9b78d784df183933f387b2289495bc36a029fb7521e22f78b589110d1f9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
