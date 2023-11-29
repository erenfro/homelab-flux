# VolSync Template

## Flux Kustomization

This requires `postBuild` configured on the Flux Kustomization

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: &app plex
  namespace: flux-system
spec:
  targetNamespace: default
  path: ./kubernetes/apps/default/plex/app
  prune: true
  sourceRef:
    kind: GitRepository
    name: home-kubernetes
  wait: false
  interval: 30m
  retryInterval: 1m
  timeout: 5m
  # ... start ...
  postBuild:
    substitute:
      APP: *app
      VOLSYNC_CAPACITY: 5Gi
  # ... end ...
```

and then call the template in your applications `kustomization.yaml`

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  # ... start ...
  - ../../../../templates/volsync
  # ... end ...
```

## Required `postBuild` vars:

- `APP`: The application name
- `VOLSYNC_CAPACITY`: The PVC size

## Optional `postBuild` vars:

- `VOLSYNC_UID`: The value for runAsUser in the mover
- `VOLSYNC_GID`: The value for runAsGroup and fsGroup in the mover
