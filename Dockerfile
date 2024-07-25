FROM ghcr.io/containerbase/base:11.1.0@sha256:b8afd77f2618d55cd4bbd8a1e59849603f37668450736e7fa48008480ddc421b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
