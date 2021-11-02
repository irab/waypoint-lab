# Waypoint Blog

## Key Points

1. Waypoint Sequence Diagram

Build --> Deploy --> Release

"Waypoint doesn't need to own or run each stage. For example, your builds may happen in CI using other tools. Waypoint can use the result of that build to perform only the "deploy" and "release" steps. Any combination can be mixed."

## 3 Stages

A build takes application source and converts it to an artifact. The build process may also include an optional push operation to push the built artifact to a registry so that it is available for the deployment platform.

A deploy takes a previously built artifact and stages it onto the target deployment platform and is available via deployment URLs or other internal means.

A release activates a previously staged deployment and opens it to general traffic.

## Remote Runners

Find out how they work

## First Steps

1. Setup github repos for GCP infra and fluxCD [done]
1. Deploy GKE [done]
1. Install Waypoint Helm Chart with Flux [done]
1. Deploy nodejs-app

## Building images without docker/containerd

1. Create GCP Artifact Repository:

```bash
gcloud artifacts repositories create cnb-test \
    --repository-format=docker \
    --location=australia-southeast1 \
    --description="Testing CNB image building"
```

2. Generate Docker config.json:

```bash
cat ~/Downloads/ira-sandbox-c040c27d35e5.json | docker login -u _json_key --password-stdin \
https://australia-southeast1-docker.pkg.dev
```

3. Deploy a container locally:

```bash
docker run -it -v $(pwd):/app  paketobuildpacks/builder`
```

4. Generate Docker config.json:

```bash
cat ~/Downloads/your_service_account_key_file.json | docker login -u _json_key --password-stdin \
https://australia-southeast1-docker.pkg.dev
```

5. Copy config.json to ~/.docker/config.json in the image
6. Run the following, where '/app' is a mounted volume with your code

```bash
/cnb/lifecycle/creator -app=/app australia-southeast1-docker.pkg.dev/ira-sandbox/cnb-test/lifecycle-test:latest
```

### Notes

Pack now supports podman and doesn't need docker installed:
https://github.com/buildpacks/pack/issues/564#issuecomment-943345649

Cloud Native Buildpacks / Paketo.io in GitLab CI without Docker & pack CLI
https://blog.codecentric.de/en/2021/10/gitlab-ci-paketo-buildpacks/

Goodbye Dockerfile: Cloud Native Buildpacks with Paketo.io & layered jars for Spring Boot
https://blog.codecentric.de/en/2020/11/buildpacks-spring-boot/
