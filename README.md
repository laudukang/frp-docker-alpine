# frp in docker

## Config

update parameters in `server/frps.ini`

```config
dashboard_user = admin
dashboard_pwd = admin
privilege_token = 12345678
subdomain_host = frp.codz.me
```

build frp image

```bash
cd frp-docker-alpine
docker build -t laudukang/frp:latest --rm .

cd server
docker-compose up -d
```

update firewall

```bash
ufw allow 7000
ufw allow 7500
ufw allow 6000:6010/tcp
ufw allow 6000:6010/udp


docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 br0
```

## Reference

- [fatedier/frp](https://github.com/fatedier/frp)
- [docker-alpine-frp](https://github.com/ihahoo/docker-alpine-frp/)
