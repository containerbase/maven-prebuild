FROM ghcr.io/containerbase/base:13.0.4@sha256:54eb74c1b3426fc3739b92b1da8f16c3294c97a973d654bc0b4822945d6d1b6a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
