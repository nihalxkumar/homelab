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
        <td><img width="32" src="https://icon.icepanel.io/Technology/svg/Ubuntu.svg"></td>
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
         <td><img width="32" src="https://github.com/traefik/traefik/raw/master/docs/content/assets/img/traefik.logo-dark.png"></td>
         <td><a href="https://traefik.io/traefik">Traefik</a></td>
         <td>Ingress controller & reverse proxy (TLSStore + Kubernetes secret-based TLS)</td>
     </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/3380462"></td>
        <td><a href="https://prometheus.io">Prometheus</a></td>
        <td>Metrics collection & alerting</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/48932923?s=200&v=4"></td>
        <td><a href="https://tailscale.com">Tailscale</a></td>
        <td>Kubernetes Operator & MagicDNS for secure service exposure</td>
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
         <td><img width="32" src="https://github.com/jetstack/cert-manager/raw/master/logo/logo.png"></td>
         <td><a href="https://jetstack.io/cert-manager">cert-manager</a></td>
         <td>Automated certificate management (Let's Encrypt DNS-01 via Cloudflare)</td>
     </tr>
    <tr>
        <td><img width="32" src="https://github.com/FiloSottile/age/raw/main/logo/logo_white.svg"></td>
        <td><a href="https://github.com/getsops/sops">SOPS + Age</a></td>
        <td>Secrets encryption at rest</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.jj-vcs.dev/latest/images/jj-logo.svg"> + <img width="32" src="https://git-scm.com/images/logo@2x.png"></td>
        <td><a href="https://jj-vcs.dev">jj + Git</a></td>
        <td>Version control with colocated .git directory</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/159397742?s=200&v=4"></td>
        <td><a href="https://github.com/glanceapp/glance">Glance</a></td>
        <td>Homepage dashboard & feed aggregator</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/45487711?s=200&v=4"></td>
        <td><a href="https://n8n.io">n8n</a></td>
        <td>Workflow automation tool</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/194295535?s=200&v=4"></td>
        <td><a href="https://github.com/AsyncFuncAI/deepwiki-open">DeepWiki</a></td>
        <td>AI-powered documentation & knowledge base</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/202258986?s=200&v=4"></td>
        <td><a href="https://github.com/karakeep-app/karakeep">KaraKeep</a></td>
        <td>Bookmarks Manager</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/14336958?s=200&v=4"></td>
        <td><a href="https://thelounge.chat">The Lounge</a></td>
        <td>Web Client for Internet Relay Chat</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn-icons-png.flaticon.com/512/7779/7779541.png"></td>
        <td><a href="https://racknerd.com">Infrastructure </a></td>
        <td>6 GB RAM, 5 vCPU, 100 GB NVMe SSD</td>
    </tr>
</table>

