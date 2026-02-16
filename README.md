# Hybrid RHEL Environment

A professional-grade hybrid lab environment integrating Windows Server Active Directory with Rocky Linux 9 (Red Hat) infrastructure. This project demonstrates automated identity management, configuration as code, and containerized application delivery.

---

## Architecture

### Infrastructure
* **Hypervisor:** VirtualBox 7.0
* **Network:** NAT Network (10.0.10.0/24)
* **Domain:** lab.local (Active Directory)
* **OS Stack:** Rocky Linux 9, Windows Server 2022

### Host Inventory
| Hostname | IP | Role | Services |
| :--- | :--- | :--- | :--- |
| **DC-01** | 10.0.10.10 | Domain Controller | AD DS, DNS, DHCP |
| **SRV-MGMT** | 10.0.10.20 | Control Node | Ansible, Samba, Git |
| **SRV-APP01** | 10.0.10.30 | App Server | Podman (Nginx, Apache, Postgres) |
| **SRV-APP02** | 10.0.10.31 | Web Server | Apache httpd |

---

## Key Technologies

### Identity & Access
* **Active Directory:** Windows Server 2022 functional level.
* **Linux Integration:** SSSD, Kerberos, and realmd for native AD joining.
* **Authorization:** AD group-based sudo mapping and PAM/NSS integration.

### Configuration & Orchestration
* **Ansible:** Role-based idempotent playbooks for host configuration and service deployment.
* **Containers:** Podman and podman-compose for rootless 3-tier application stacks.

### Security & Storage
* **Security:** SELinux (Enforcing), Firewalld, and SSH key-based authentication.
* **Traffic:** External SSL/TLS termination via Cloudflare Tunnels. (In-Progress)
* **Storage:** SMB/Samba file sharing integrated with AD authentication.

---

## Project Status

### Identity Integration
* [x] Domain join successful on all Rocky hosts.
* [x] SSH login enabled for domain credentials.
* [x] sudo permissions mapped to AD security groups.

### Automation & Delivery
* [x] Idempotent Ansible playbooks managing all hosts.
* [x] Automated 3-tier stack (Nginx/Apache/Postgres) deployment.
* [x] Containers configured to persist and start on boot.

### Maintenance & Monitoring
* [x] Automated health check script deployed via Cron (5-minute interval).
* [x] Centralized logging to /var/log/srv-health.log.
* [x] Documented Git history with 10+ commits.

---

## Deployment

To rebuild this environment:

1. **Network:** Provision a VirtualBox NAT Network at 10.0.10.0/24.
2. **Domain:** Promote DC-01 and establish the lab.local forest.
3. **Management:** Install Ansible on SRV-MGMT and configure SSH keys for all nodes.
4. **Orchestration:** Run the site-wide playbook:
   ```bash
   ansible-playbook -i inventory site.yml
