FROM node:lts-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="firebase-tools-base" \
      org.label-schema.description="A lightweight Docker image with Firebase CLI for use in the CI/CD pipelines." \
      org.label-schema.version=${VERSION} \
      org.label-schema.build-date=${BUILD_DATE} \ 
      org.label-schema.url="https://github.com/firebase/firebase-tools" \
      org.label-schema.vcs-url="https://github.com/acernikovs/docker-firebase-tools-base" \
      org.label-schema.vcs-ref=${VCS_REF}

RUN npm install -g firebase-tools@${VERSION}
CMD ["sh"]
