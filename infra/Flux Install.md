# Steps to install FluxCD

1. Generate Token
1. Export token with `export GITHUB_TOKEN=$token`
1. `brew install fluxcd/tap/flux`
1. Login to Cluster as Admin
1. `flux bootstrap github \
  --owner=irab \
  --repository=waypoint-gke-flux \
  --path=clusters/dev/waypoint-gke \
  --personal`
1. 