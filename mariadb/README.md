The [db](docker-compose.yml) service will handle all (MySQL) database needs for other services like [vaultwarden](../vaultwarden/docker-compose.yml) and [notes](../standardnotes/docker-compose.yml).

## Environment variables

The following db password environment values must be string-replaced across all files in this repo:

- `my-mariadb-root-password`
- `my-mariadb-vaultwarden-password`
- `my-mariadb-standardnotes-password`
