FROM ghcr.io/containerbase/base:14.66.1@sha256:556f8a473cefba14b7942a140a1900beb3bc178dd36e0e129961c18933e7ae11

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
