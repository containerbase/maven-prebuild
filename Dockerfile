FROM ghcr.io/containerbase/base:14.6.9@sha256:cc3893c06ba2b1f1fcc50b2f4c235113c0f20d38912df3b5cb39eab2e05423b9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
