# Non-stop Deploy Server blog
## Non-stop deploy
### DEPLOY
```bash
$ flyctl deploy
```

## Auto LB using Docker compose
### BUILD
```bash
$ docker build -t choi3179/blog-a:0.1.0 -f serv-a/Dockerfile serv-a
$ docker build -t choi3179/blog-b:0.1.0 -f serv-b/Dockerfile serv-b
```
### PUSH
```bash
$ docker push choi3179/blog-a:0.1.0
$ docker push choi3179/blog-b:0.1.0
```
### RUN
```bash
$ docker compose -f compose/auto_lb/compose.yml  up -d --build --force-recreate
```