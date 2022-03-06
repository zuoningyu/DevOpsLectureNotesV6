# Description

This is to demostrate Docker Swarm's usage.

# TLDR;
1. Run `./run.sh`
```
./run.sh
```
2. View visualizer http://127.0.0.1:8080

# Manual Steps

## 1. Init Docker swarm

```
docker swarm init
```
note: you might need to set `--advertise-addr` if you have multiple IP addresses.

## 2. (Optional) For some machine, it needs to reset ingress network
If you see the error below, 
```
ERROR: Pool overlaps with other one on this address space
```
please run these two commands to reset ingress network.
```
docker network rm ingress
docker network create \
  --driver overlay \
  --ingress \
  --subnet=10.11.0.0/16 \
  --gateway=10.11.0.2 \
  --opt com.docker.network.driver.mtu=1200 \
  my-ingress
```
## 3. Open a terminal and change to the `docker-swarm` directory.
```
cd docker-swarm
```
## 4. Start a visualizer
```
docker service create \
  --name=viz \
  --publish=8080:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer
```

## 5. Deploy a stack
```
docker stack deploy -c docker-compose.yaml
```

## 6. Check the service
```
docker service ls
docker service ps your_service_name_from_ls_command
```

## 7. Scale the service
```
docker service scale your_service_name_from_ls_command=15
```
