FROM ghcr.io/containerbase/base:14.13.12@sha256:3d30cd7ec586567f9ed4b98570b485c9ddfe1e60019f0ab6cdf451677d1ca42b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
