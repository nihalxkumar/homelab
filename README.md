# 🔬 Homelab

This repository uses **Infrastructure as Code** and **GitOps** principles to fully automate the provisioning, configuration, and continuous deployment of self-hosted services in my personal homelab.

#### The purpose of this homelab:

- Self host things for freedom

- Learn Kubernetes along the way

- Bring jj to practice

- Explore, Experiment, and have fun.

#### Explore the directories:

- **`Justfile`** - Task runner for common operations (provisioning, kubeconfig sync, SOPS encryption, certificate verification, etc.)
- **`ansible/`** - Ansible playbooks for bare-metal provisioning, K3s installation, security hardening, and Tailscale configuration
- **`kubernetes/`** - Kubernetes manifests organized by:
  - `apps/` - Application deployments managed via GitOps
  - `bootstrap/` - Core cluster components (ArgoCD, etc.)
  - `infrastructure/` - Infrastructure-level resources (Traefik ingress, cert-manager, DNS-01 ACME, etc.)
- **`terraform/`** - Terraform configurations for cloud resource provisioning
- **`scripts/`** - Utility scripts for automation and maintenance


## Stack

<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Ubuntu_logoib.svg/960px-Ubuntu_logoib.svg.png"></td>
        <td><a href="https://ubuntu.com">Ubuntu Server</a></td>
        <td>Base OS for Kubernetes nodes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/49319725"></td>
        <td><a href="https://k3s.io">K3s</a></td>
        <td>Lightweight Kubernetes distribution</td>
    </tr>
    <tr>
        <td><img width="32" src="https://simpleicons.org/icons/ansible.svg"></td>
        <td><a href="https://www.ansible.com">Ansible</a></td>
        <td>Bare-metal provisioning & node configuration</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/30269780"></td>
        <td><a href="https://argoproj.github.io/cd">ArgoCD</a></td>
        <td>GitOps continuous delivery for Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/314135?s=200&v=4"></td>
        <td><a href="https://www.cloudflare.com">Cloudflare</a></td>
        <td>DNS-01 ACME challenges + DDoS/WAF protection via Tunnel</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png"></td>
        <td><a href="https://www.docker.com">Docker</a></td>
        <td>Container Runtime</td>
    </tr> 
    <tr>
        <td><img width="32" src="https://grafana.com/static/img/menu/grafana2.svg"></td>
        <td><a href="https://grafana.com">Grafana</a></td>
        <td>Observability & dashboards</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/13629408"></td>
        <td><a href="https://kubernetes.io">Kubernetes</a></td>
        <td>Container-orchestration system</td>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Traefik_Logo.svg/960px-Traefik_Logo.svg.png"></td>
        <td><a href="https://traefik.io/traefik">Traefik</a></td>
        <td>Ingress controller & reverse proxy with cert-manager TLS</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/3380462"></td>
        <td><a href="https://prometheus.io">Prometheus</a></td>
        <td>Metrics collection & alerting</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/48932923?s=200&v=4"></td>
        <td><a href="https://tailscale.com">Tailscale</a></td>
        <td>Disabling Public SSH to only allow Tailnet configuration</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/100373852?s=200&v=4"></td>
        <td><a href="https://cloudnative-pg.io">CloudNativePG</a></td>
        <td>PostgreSQL Operator for Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/48380765?s=200&v=4"></td>
        <td><a href="https://www.nextdns.io">NextDNS</a></td>
        <td>Smart and Reliable DNS resolver</td>
    </tr>
    <tr>
        <td><img width="32" src="https://simpleicons.org/icons/terraform.svg"></td>
        <td><a href="https://terraform.io">Terraform</a></td>
        <td>Infrastructure as Code for cloud resources</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/14336958?s=200&v=4"></td>
        <td><a href="https://jetstack.io/cert-manager">cert-manager</a></td>
        <td>Kubernetes certificate management (Let's Encrypt DNS-01)</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/FiloSottile/age/raw/main/logo/logo_white.svg"></td>
        <td><a href="https://github.com/getsops/sops">SOPS + Age</a></td>
        <td>Secrets encryption at rest</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/14336958?s=200&v=4"></td>
        <td><a href="https://thelounge.chat">The Lounge</a></td>
        <td>Web Client for Internet Relay Chat</td>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Kvmbanner-logo2_1.png/960px-Kvmbanner-logo2_1.png?20131022114630"></td>
        <td><a href="https://racknerd.com">Infrastructure </a></td>
        <td>6 GB RAM, 5 vCPU, 100 GB NVMe SSD</td>
    </tr>
</table>
