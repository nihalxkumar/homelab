# n8n Workflow Automation Platform

This deployment implements enterprise-grade practices for running n8n in a production environment:

- **Security**: Non-root containers, network policies, SOPS-encrypted secrets, restricted web access.
- **Reliability**: Health checks, resource limits, graceful shutdown handling
- **Persistence**: 10GB data storage, 20GB backup storage with automated daily backups
- **Monitoring**: Prometheus PodMonitor for metrics collection
- **Automation**: ArgoCD GitOps deployment, automated certificate management

## Configuration

### Domain Setup

Update the following files with your domain:

- `configmap.yaml`: N8N_HOST, WEBHOOK_URL, N8N_EDITOR_BASE_URL
- `ingress.yaml`: Host match rule
- `certificate.yaml`: dnsNames

### Secret Management

Generate encryption key:

```bash
openssl rand -base64 32
```

Edit `secret.sops.yaml` and update:
- N8N_ENCRYPTION_KEY
- N8N_BASIC_AUTH_PASSWORD

Encrypt with SOPS:

```bash
sops --encrypt --in-place secret.sops.yaml
```

## Deployment

## PostgreSQL Database when needed

2. Update `configmap.yaml`:
   ```yaml
   DB_TYPE: "postgresdb"
   ```
3. Add PostgreSQL credentials to `secret.sops.yaml`
4. Re-encrypt and redeploy

## Backup and Recovery

### Automated Backups

CronJob runs daily at 2 AM, retaining 30 days of backups.

### Manual Backup

```bash
kubectl create job -n n8n --from=cronjob/n8n-backup n8n-backup-manual
```

### Restore

```bash
kubectl exec -n n8n deployment/n8n -- tar xzf /path/to/backup.tar.gz -C /home/node/.n8n
kubectl rollout restart deployment/n8n -n n8n
```
