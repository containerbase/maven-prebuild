FROM ghcr.io/containerbase/base:13.20.3@sha256:54e80bd57911026f67ba50317f9de281e6359b020feeb2bfaf40e33bfae94b8c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
