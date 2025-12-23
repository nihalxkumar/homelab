#!/usr/bin/env bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_prerequisites() {
    log_info "Checking prerequisites..."
    
    if ! command -v kubectl &> /dev/null; then
        log_error "kubectl is not installed"
        exit 1
    fi
    log_success "kubectl found"
    
    if ! command -v sops &> /dev/null; then
        log_error "sops is not installed"
        exit 1
    fi
    log_success "sops found"
    
    if ! kubectl cluster-info &> /dev/null; then
        log_error "Cannot connect to Kubernetes cluster"
        exit 1
    fi
    log_success "Connected to Kubernetes cluster"
}

validate_secret() {
    log_info "Validating secret configuration..."
    
    local secret_file="secret.sops.yaml"
    
    if [ ! -f "$secret_file" ]; then
        log_error "Secret file not found: $secret_file"
        exit 1
    fi
    
    if grep -q "CHANGE_ME" "$secret_file"; then
        log_error "Secret file contains CHANGE_ME placeholders"
        log_error "Please update the secret values before deploying"
        exit 1
    fi
    
    if ! sops -d "$secret_file" &> /dev/null; then
        log_error "Failed to decrypt secret file"
        log_error "Make sure the file is encrypted with SOPS"
        exit 1
    fi
    
    log_success "Secret validation passed"
}

deploy() {
    log_info "Starting n8n deployment..."
    
    log_info "Applying Kubernetes manifests..."
    kubectl apply -k . --server-side
    
    log_success "Manifests applied successfully"
    
    log_info "Waiting for namespace..."
    kubectl wait --for=jsonpath='{.status.phase}'=Active namespace/n8n --timeout=30s
    
    log_info "Waiting for deployment to be ready..."
    kubectl rollout status deployment/n8n -n n8n --timeout=5m
    
    log_success "Deployment is ready"
}

show_status() {
    log_info "Deployment Status:"
    echo ""
    
    echo "Pods:"
    kubectl get pods -n n8n
    echo ""
    
    echo "Services:"
    kubectl get svc -n n8n
    echo ""
    
    echo "Ingress:"
    kubectl get ingressroute -n n8n
    echo ""
    
    echo "Storage:"
    kubectl get pvc -n n8n
    echo ""
    
    log_info "Recent logs:"
    kubectl logs -n n8n -l app=n8n --tail=20 || log_warn "Could not fetch logs"
    echo ""
    
    log_success "n8n is accessible at: https://n8n.nihalxkumar.dev"
    log_info "View logs: kubectl logs -n n8n -l app=n8n -f"
    log_info "Check status: kubectl get all -n n8n"
}

main() {
    log_info "n8n Production Deployment"
    log_info "========================="
    echo ""
    
    cd "$(dirname "$0")"
    
    check_prerequisites
    validate_secret
    deploy
    show_status
    
    echo ""
    log_success "Deployment completed successfully"
}

main "$@"
