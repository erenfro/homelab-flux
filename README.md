# Psi-Jack's HomeLab Kubernetes cluster backed by Flux, GitOps and BGP

<div align="center">

[![Discord](https://img.shields.io/discord/673534664354430999?color=7289da&label=DISCORD&style=for-the-badge&logo=discord)](https://discord.gg/k8s-at-home 'k8s at home Discord Community')
[![GitHub stars](https://img.shields.io/github/stars/erenfro/homelab-flux?color=green&style=for-the-badge)](https://github.com/erenfro/homelab-flux/stargazers 'This repo star count')
[![GitHub last commit](https://img.shields.io/github/last-commit/erenfro/homelab-flux?color=purple&style=for-the-badge)](https://github.com/erenfro/homelab-flux/commits/main 'Commit History')\
[![Release](https://img.shields.io/github/v/release/erenfro/homelab-flux?style=for-the-badge)](https://github.com/erenfro/homelab-flux/releases 'Repo releases')

</div>

## 👋 Introduction

This repository is for my homelab which combineds Proxmox VE with Kubernetes using K3s. It's based on the k8s-at-home [flux template](https://github.com/onedr0p/flux-cluster-template). It's supported by [k3s](https://k3s.io) cluster with [Ansible](https://www.ansible.com) backed by [Flux](https://toolkit.fluxcd.io/) and [SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/).

## 🔧 Hardware

| Name   | Device         | CPU            | OS Disk   | Data Disk   | RAM  | OS     | Purpose                    |
|--------|----------------|----------------|-----------|-------------|------|--------|----------------------------|
| hv1    | Custom         | Ryzen 7 5700G  | 240GB SSD | 3TiB, 4TiB  | 32GB | Debian | PVE, control-plane, worker |
| hv2    | Custom         | Ryzen 5 5600G  | 240GB SSD | 3TiB, 4TiB  | 32GB | Debian | PVE, control-plane, worker |
| hv3    | Custom         | Ryzen 5 5600G  | 240GB SSD | 3TiB, 4TiB  | 32GB | Debian | PVE, control-plane, worker |

Total CPU: 40 threads

Total RAM: 96 GB

### Supporting Hardware

| Name   | Device         | CPU        | OS Disk   | Data Disk | RAM   | OS       | Purpose               |
|--------|----------------|------------|-----------|-----------|-------|----------|-----------------------|
| NAS    | Synology DS416 | 2x AL212   | 11TiB HDD | ZFS 56TB  | 1GB   | DSM 7.x  | NAS/NFS/Backup        |

### Networking/UPS Hardware

| Device         | Purpose                |
|----------------|------------------------|
| EdgeRouter PoE | Router/BGP             |
| 2xHP ProCurve  | 24-port Switches       |
| APC Back-UPS   | UPS hv1                |
| APC Back-UPS   | UPS hv2                |
| APC Back-UPS   | UPS hv3                |
| CyberPower     | UPS Network/Router/NAS |

## 🤝 Thanks

Learning Kubernetes has been great. Thanks to the people at k8s-at-home, I've taken, worked with people that are friendly and helpful, and finally been able to really start learning something I'd put off for years, because of my disdain for what Docker did so many years ago with it's first clobbering of my 172.18.0.0/22 desktop network because my server network is on 172.17.0.0/16.
