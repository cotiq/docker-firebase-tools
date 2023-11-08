# firebase-tools-base
![build status](https://github.com/acernikovs/docker-firebase-tools-base/actions/workflows/ci.yaml/badge.svg)


A lightweight [Docker image](https://hub.docker.com/r/acernikovs/firebase-tools-base) with Firebase CLI for use in the CI/CD pipelines.

### How to use in Gitlab workflows


In the workflow yaml file, use the image `acernikovs/firebase-tools-base:latest`. 


```
# Other pipeline stages omitted for brevity

deploy-production:
  stage: deploy
  image: acernikovs/firebase-tools-base:latest
  script:
    - firebase deploy --only hosting -m "Pipeline $CI_PIPELINE_ID, build $CI_BUILD_ID" --non-interactive
  only:
    - main
```
