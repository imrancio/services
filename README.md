# Microservices

This repo will store the configuration for all microservices running on my personal domain [imranc.io](https://imranc.io). Services run in `docker` containers and are orchestrated by `docker-compose`.

## Prerequisites

- docker
- docker-compose
- git

To install required packages in ubuntu:

```bash
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce docker-compose
sudo usermod -aG docker ${USER}
su - ${USER}
```

## Environment variables

All required `.env` files are committed to this repo for convenience. However, some configuration must be changed in order to ensure security of your deployed services. See additional configuration docs.

## Domain name

String-replace `domain.tld` and `domain\\.tld` (ensure to keep escaped `\\.` intact in traefik rules) across all files that are not documentation (`.md`) files with your personal `domain.tld`. The following default subdomains will be used to deploy microservices:

- `blog`
- `notes`
- `notes-api`
- `proxy`
- `vault`
- `www`

You must configure your DNS records to have an A record for your personal `domain.tld` that points to the static IP address (elastic IP address in AWS) of your VPS and CNAME records for all your subdomains that point to your personal `domain.tld`. The [traefik](traefik/docker-compose.yml) service will handle all routing among subdomains/paths and apply any necessary middleware.

## Additional configurations

- [imrancio-blog](imrancio-blog/README.md)
- [mariadb](mariadb/README.md)
- [standardnotes](standardnotes/README.md)
- [traefik](traefik/README.md)
- [vaultwarden](vaultwarden/README.md)

## Start services

All docker services communicate via external network `backend`. To create the docker network:

```bash
docker network create backend
```

To start the docker services via docker-compose:

```bash
# order of operations is important
cd mariadb && docker-compose up -d
cd ../redis && docker-compose up -d
cd ../traefik && docker-compose up -d
cd ../blog && docker-compose up -d
cd ../vaultwarden && docker-compose up -d
cd ../standardnotes && docker-compose up -d
```
