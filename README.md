# firebase-tools
![build status](https://github.com/cotiq/docker-firebase-tools/actions/workflows/ci.yaml/badge.svg)


A lightweight [Docker image](https://hub.docker.com/r/cotiq/firebase-tools) with Firebase CLI.

### How to use in GitHub Actions


In the workflow yaml file, use the image `cotiq/firebase-tools:latest`.


```
jobs:

# Other pipeline stages omitted for brevity

  deploy:
    runs-on: ubuntu-latest
    container:
      image: cotiq/firebase-tools:latest
      env:
        FIREBASE_TOKEN: "${{ secrets.FIREBASE_TOKEN }}"
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Install dependencies
        run: npm install

      - name: Build App
        run: npm run build

      - name: Deploy to Firebase
        run: |
          firebase use production
          firebase deploy --only hosting -m "Pipeline $GITHUB_RUN_NUMBER, build $GITHUB_RUN_ID" --non-interactive

```


### How to use in Gitlab workflows


In the workflow yaml file, use the image `cotiq/firebase-tools:latest`. 


```
# Other pipeline stages omitted for brevity

deploy-production:
  stage: deploy
  image: cotiq/firebase-tools:latest
  script:
    - firebase deploy --only hosting -m "Pipeline $CI_PIPELINE_ID, build $CI_BUILD_ID" --non-interactive
  only:
    - main
```
