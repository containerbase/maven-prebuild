FROM ghcr.io/containerbase/base:11.1.7@sha256:7661c62d53cb84b42cdd339050d6ccc3d5a46e79c78a07006be7e6fe70f0985a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
