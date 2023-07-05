FROM ghcr.io/kahu-app/cli:v0.2.0

ARG VERSION=latest

COPY entrypoint.sh /entrypoint.sh

LABEL maintainer="Kahu.app <contact@kahu.app>" \
      org.opencontainers.image.authors="contact@kahu.app" \
      org.opencontainers.image.base.name="ghcr.io/kahu-app/github-action:${VERSION}" \
      org.opencontainers.image.source="https://github.com/kahu-app/github-action" \
      org.opencontainers.image.title="Kahu: Github Action" \
      org.opencontainers.image.description="Monitor software dependencies for malicious code before they reach you" \
      org.opencontainers.image.url="https://github.com/kahu-app/github-action" \
      org.opencontainers.image.vendor="Kahu.app" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.licenses="MIT"

ENTRYPOINT ["/entrypoint.sh"]
