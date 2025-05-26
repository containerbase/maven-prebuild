FROM ghcr.io/containerbase/base:13.8.35@sha256:6cb30245c05e1b37f16cb111c138cfb7812ceb8888597380d41719334d777bfb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
