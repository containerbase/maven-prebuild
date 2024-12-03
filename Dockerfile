FROM ghcr.io/containerbase/base:13.0.26@sha256:904f072bd2ee435e97fdaa4d6abf7546d81dc93277335fa48910de910e9ef877

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
