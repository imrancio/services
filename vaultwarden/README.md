## Prerequisites

1. Set up SMTP relay service for your email provider (see [here](https://apps.google.com/supportwidget/articlehome?hl=en&article_url=https%3A%2F%2Fsupport.google.com%2Fa%2Fanswer%2F176600%3Fhl%3Den&product_context=176600&product_name=UnuFlow&trigger_context=a) for Google Workspaces)
2. Set up two-factor authentication for your email address
3. Set up an App Password so vaultwarden can authenticate and send emails (see [here](https://support.google.com/accounts/answer/185833?hl=en) for Google Workspaces)

## Environment variables

Change the following environment variables in [secrets.env](secrets.env):

- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD` (use App Password set up during prerequisites)
- `ADMIN_TOKEN` (use `openssl rand -base64 64` command to generate)
