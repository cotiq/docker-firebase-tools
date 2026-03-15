FROM node:22-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.opencontainers.image.title="firebase-tools" \
      org.opencontainers.image.description="A lightweight Docker image with Firebase CLI" \
      org.opencontainers.image.version=${VERSION} \
      org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.source="https://github.com/cotiq/docker-firebase-tools" \
      org.opencontainers.image.revision=${VCS_REF}

RUN npm install -g firebase-tools@"${VERSION}" --omit=optional && \
    npm cache clean --force
CMD ["sh"]
