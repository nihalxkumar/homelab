set shell := ["bash", "-c"]

# --- Helpers ---
default:
    @just --list

# --- Infrastructure (Ansible) ---

ping:
    cd ansible && ansible -i inventory/hosts.ini all -m ping

provision:
    cd ansible && ansible-playbook -i inventory/hosts.ini k3s.yml -K

# Run a specific playbook (usage: just run-playbook security.yml)
run-playbook playbook:
    cd ansible && ansible-playbook -i inventory/hosts.ini {{playbook}}

# Configure DNS and Cloudflare Tunnel for hybrid setup
setup-dns:
    cd ansible && ansible-playbook -i inventory/hosts.ini dns-tunnel.yml -K

# --- Kubernetes (K8s) ---

sync-kubeconfig:
    scp arjun@192.3.1.204:~/.kube/config ~/.kube/config-vps
    @echo "Config saved to ~/.kube/config-vps. Exporting KUBECONFIG..."
    @echo "Run: export KUBECONFIG=~/.kube/config-vps"

status:
    watch kubectl get nodes,pods -A

verify-cert:
    export KUBECONFIG=~/.kube/config-vps && kubectl get certificate -A && echo "" && kubectl get clusterissuer -o wide

logs-cert:
    export KUBECONFIG=~/.kube/config-vps && kubectl logs -n cert-manager -l app=cert-manager -f

tunnel-status:
    ssh arjun@100.84.231.21 "systemctl status cloudflared && echo '---' && cloudflared tunnel list"

tunnel-logs:
    ssh arjun@100.84.231.21 "journalctl -u cloudflared -n 100 -f"

# --- Security (SOPS) ---

encrypt file:
    sops --encrypt --in-place {{file}}

decrypt file:
    sops --decrypt --in-place {{file}}

# --- Validation & Linting ---

lint:
    @echo "Linting Ansible playbooks..."
    ansible-lint ansible/ -p || true
    @echo ""
    @echo "Checking for unencrypted secrets..."
    @find kubernetes -path "*/secrets/*" -name "*.yaml" ! -name "*.sops.yaml" -type f | grep . && echo "WARNING: Unencrypted secrets found!" || echo "✓ All secrets use .sops.yaml extension"

validate:
    @echo "Validating Kubernetes manifests..."
    @find kubernetes -name "kustomization.yaml" -type f | while read kust_file; do \
        dir=$(dirname "$kust_file"); \
        echo "Building $dir..."; \
        kustomize build "$dir" > /dev/null || exit 1; \
        echo "  ✓ $dir"; \
    done
    @echo ""
    @echo "✓ All Kustomize builds passed"

kustomize-build path="kubernetes":
    @echo "Building Kustomize overlay: {{path}}"
    kustomize build {{path}}
