FROM ghcr.io/containerbase/base:13.8.69@sha256:0c95996454a315ba1c2375fad6240d894730841b167dcd5b5dffa853dfe6147a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
