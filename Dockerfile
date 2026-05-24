FROM ghcr.io/containerbase/base:14.10.17@sha256:9c8bfe65ac1041cbf3f0c22dafefc2385e129067948286cccc7f287e66b01c93

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
