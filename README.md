# Weatherapp

Application to display current weather:

- <http://shatohin.space>

## Local development

```plain
$ git clone https://github.com/dshatohin/weatherapp.git
$ docker-compose up
```

Backend running on port 9000 and frontend - on port 8000.

## Docker

Directories [`backend`](/backend) and [`frontend`](/frontend) contains `Dockerfiles` for prod and dev builds.

For backend distroless image is used - [GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless)

## Cloud

Using Azure cloud provisioned by [`terraform`](/terraform).

The cheapest VMs possible -- $4 per month.

## Ansible

Using `ansible-pull` tool and `cloud-init`.

No need for manual **ansible run** every time changes made.

## Improvements

- GitHub Actions for building and deploying
- Use CDN for static content (instead of Nginx)
- scripts/makefile for local run
