FROM ghcr.io/containerbase/base:14.10.3@sha256:8fac17d1f8e9b1907a14c802a02679de86dfa13f42ee1f873c150a85f4a8a77d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
