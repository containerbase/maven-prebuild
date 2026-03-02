FROM ghcr.io/containerbase/base:14.4.10@sha256:76ddcd8525a82ac97a9218f5432b38a195111002923d7bf46ede7319718567d1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
