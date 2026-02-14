# RHEL Research Homelab
### Proof of Concept

## Infrastructure
- Hypervisor : VirtualBox 7.0
- Network: NAT Network 'homelab-net' (10.0.10.0/24)

## Hosts
- DC-01: 10.0.10.10 (Windows Server 2022, AD DS, DNS)
- SRV-MGMT: 10.0.10.20 (Rocky Linux 9, domain-joined)

### Domain Details
- Domain: lab.local
- AD Users: ansible_svc, testuser1, admin_user
- Security Group: Linux-Admins (grants sudo on Linux hosts within /etc/sudoers.d/linux-admins)
