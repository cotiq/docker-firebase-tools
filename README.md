# firebase-tools-base
![build status](https://github.com/acernikovs/docker-firebase-tools-base/actions/workflows/ci.yaml/badge.svg)


A lightweight Docker image with Firebase CLI for use in GitLab deployment pipelines.
It slightly speeds up the deployment process to Firebase hosting.


### Usage


In the deployment stage of the GitLab pipeline file, use the image `acernikovs/firebase-tools-base:latest` and remove the command that installs `firebase-tools`. 

Below is a very simple example snippet:

```
# Other pipeline stages omitted for brevity

deploy-production:
  stage: deploy
  image: acernikovs/firebase-tools-base:latest
  script:
    - firebase use production --token $FIREBASE_TOKEN
    - firebase deploy --only hosting -m "Pipeline $CI_PIPELINE_ID, build $CI_BUILD_ID" --non-interactive --token $FIREBASE_TOKEN
  only:
    - main
```
