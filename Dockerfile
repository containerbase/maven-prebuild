FROM ghcr.io/containerbase/base:14.68.5@sha256:66c54b7155f5d397f9e5a91341a4b8c1172ae1a1d47403017e57eada24686d07

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
