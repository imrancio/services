## Traefik dynamic configuration

Configure [traefik_dynamic.yml](traefik_dynamic.yml):

### Traefik dashboard

Replace `proxy.domain.tld` with your personal `subdomain.domain.tld` where you want to host the dashboard for `traefik` service.

#### Basic HTTP auth for traefik dashboard

Replace `example:$apr1$tJRjpKo9$nWG0X80QpK7LpdPEWKQYw1` with username:password combination that will be used to access traefik dashboard at https://proxy.domain.tld/dashboard/. Run the following command to generate username/password combination:

```bash
# change username and password to different values
htpasswd -nb username password | openssl base64
```

### AWS S3 static file hosting proxy

Replace `files.domain.tld` with your personal `subdomain.domain.tld` where the static files server will be hosted.

Replace `http://files.domain.tld.s3-website-ap-southeast-1.amazonaws.com` with the address of your static AWS S3 bucket address. The S3 bucket name must match the `subdomain.domain.tld` used for the `files` service. For example, if `files` service will be hosted at `files.domain.tld`, you must create a public S3 bucket at `s3://files.domain.tld` to store any static files and enable static website hosting.

### LetsEncrypt email address

Replace `example@domain.tld` with your personal email address that will be used by letsencrypt to generate TLS certificates for your domain.
