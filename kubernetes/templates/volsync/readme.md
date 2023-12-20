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
- `VOLSYNC_CLAIM`: The PVC claim name to use instead of the default APP name
- `VOLSYNC_ACCESSMODES`: Access mode for PVC ReadWriteOnce/ReadWriteMany
- `VOLSYNC_STORAGECLASS`: StorageClass for PVC (longhorn-snapshot)
- `VOLSYNC_SNAPSHOTCLASS`: SnapshotClass for PVC (longhorn-snapclass)
- `VOLSYNC_RECLAIM_POLICY`: Reclaim policy for PVC (Retain)
- `VOLSYNC_CACHE_CAPACITY`: Backup Cache capacity. (8Gi)
