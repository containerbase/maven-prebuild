FROM ghcr.io/containerbase/base:13.23.20@sha256:b7d8ddc9c0577093d7ad2342c4e79f5e98c2e288252be6fe7e2e69be8f0c6605

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 25.0.1+8.0.LTS

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
