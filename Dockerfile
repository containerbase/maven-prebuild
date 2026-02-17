FROM ghcr.io/containerbase/base:14.3.0@sha256:67cee5cd4d7eceeccd42074c63cc32e0977dcfd7c1662fc5b1efd9dd83147615

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
