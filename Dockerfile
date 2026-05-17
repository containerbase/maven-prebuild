FROM ghcr.io/containerbase/base:14.10.14@sha256:43f7249ae179aee31b55e0ae4f068344d33845ba3400fe54743968498981e89c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
