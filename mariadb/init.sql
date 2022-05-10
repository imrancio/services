CREATE DATABASE vaultwarden;
GRANT ALL PRIVILEGES ON vaultwarden.* TO 'vaultwarden'@'%' IDENTIFIED BY 'my-mariadb-vaultwarden-password';

CREATE DATABASE standardnotes;
GRANT ALL PRIVILEGES ON standardnotes.* TO 'standardnotes'@'%' IDENTIFIED BY 'my-mariadb-standardnotes-password';

FLUSH PRIVILEGES;
