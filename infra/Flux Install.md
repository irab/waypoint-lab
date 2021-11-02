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

## Troubleshooting

### Authtokens

Need to be retrieved from k8s secret:

```
kubectl get secret waypoint-server-token -o jsonpath="{.data.token}" | base64 --decode
```

### Runner fails to start on Chart redeployment

Due to the PVC still existing, new secrets for the runners are not deployed as a part of the bootstrap process

The PVC needs to be deleted and unbound and the chart redeployed
