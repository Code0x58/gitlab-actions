## GitHub Actions in GitLab CI

This repository builds [a Docker image](https://hub.docker.com/r/code0x58/act) which can be used with the `.gitlab-ci.yml` in GitLab to run a repository's [GitHub Actions](https://github.com/features/actions) via [act](https://github.com/nektos/act).

```yaml
variables:
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_DRIVER: overlay2
services:
  - docker:dind

stages:
  - action

GitHub Actions:
  image: code0x58/act
  stage: action
  script:
    # fix GitLab's non-symbolic-ref HEAD
    - git checkout -B "$CI_COMMIT_REF_NAME" "$CI_COMMIT_SHA"
    - act --list
    - DOCKER_API_VERSION=1.39 act
```

You can see the pipline runs for this repository on [GitLab](https://gitlab.com/obristow/gitlab-actions/pipelines).
