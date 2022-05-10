## Prerequisites

Clone the standardnotes-extensions repo in this directory and symlink environment variables to repo:

```bash
git clone https://github.com/iganeshk/standardnotes-extensions.git
ln -s extensions.env ./standardnotes-extensions/.env
```

## Environment variables

#### auth

The following environment variable values must be replaced in [auth.env](auth.env) and [.env](.env) (generate new values for each with command `openssl rand -hex 32`):

- `JWT_SECRET`
- `LEGACY_JWT_SECRET`
- `PSEUDO_KEY_PARAMS_KEY`
- `ENCRYPTION_SERVER_KEY`
- `AUTH_JWT_SECRET`

#### extensions

String-replace `my-github-username` and `my-github-personal-access-token` in [extensions.env](extensions.env) with you personal github username and access token.

## Enable subscriptions

To add a subscription to your self-hosted user account, run the following commands after registering a new standardnotes account with your self-hosted syncing server (e.g. https://notes-api.domain.tld):

```bash
# replace with real mariadb root password
docker-compose exec db sh -c 'MYSQL_PWD=my-mariadb-root-password mysql standardnotes'
```

```sql
-- replace <EMAIL@ADDR> with real email address used to register standardnotes account
INSERT INTO user_roles (role_uuid, user_uuid) VALUES ( (SELECT uuid FROM roles WHERE name="PRO_USER" ORDER BY version DESC LIMIT 1), (SELECT uuid FROM users WHERE email="<EMAIL@ADDR>") ) ON DUPLICATE KEY UPDATE role_uuid = VALUES(`role_uuid`);
```

```sql
-- replace <EMAIL@ADDR> with real email address used to register standardnotes account and subscription_id with incrementing integer values for every user_subscriptions record added
INSERT INTO user_subscriptions SET uuid = UUID(), plan_name="PRO_PLAN", ends_at = 8640000000000000, created_at = 0, updated_at = 0, user_uuid= (SELECT uuid FROM users WHERE email="<EMAIL@ADDR>"), subscription_id=1, subscription_type=1;
```

## ✨ You Should Know
Building Standard Notes has high costs. If everyone evaded contributing financially, we would no longer be here to continue to build upon and improve these services for you. Please consider [donating](https://standardnotes.com/donate) if you do not plan on purchasing a subscription.

source: https://docs.standardnotes.com/self-hosting/subscriptions
