FROM ghcr.io/containerbase/base:14.9.2@sha256:68c1d098119a465b2585301ad581a76ff7e1f76342baeffe7bbdf7e59dce1aa9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
