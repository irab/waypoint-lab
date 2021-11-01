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

## Demo

1. Setup github repos for GCP infra and fluxCD [done]
1. Deploy GKE [done]
1. Install Waypoint Helm Chart with Flux [done]
1. Deploy nodejs-app
