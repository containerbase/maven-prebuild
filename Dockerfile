FROM ghcr.io/containerbase/base:13.8.31@sha256:88a16f312342b1386b70995452437fd2a434cf38bb56194037e87f3e531525c0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
