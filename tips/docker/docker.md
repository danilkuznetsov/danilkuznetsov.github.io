---
layout: page
title: Docker Tips
permalink: /tips/docker
---

- Networking Tips
  - Connecting a container to the host system

### Connecting applications inside docker container to external services on the host system

As example, take a regular database service -> PostgreSQL.

#### A brief review of the theory

By default, Docker uses a `bridge network driver` as the main network configuration.

A `bridge` is a device from channel level that connects different network segments. The device can have either hard or software implementation.

Docker uses a software implementation of a `bridge` device.

This approach works only inside one host. The bridge is used for communicating different containers on the same host. Docker daemon automatically adds new rules to the iptables configuration.

In addition to using a pre-defined network, a user can create custom networks for his tasks.

In the case of a custom network, containers from different networks cannot connect to each other without additional configurations.

Host system sees this bridge as a standard Linux bridge [More information -> Arch Wiki Network Bridge](https://wiki.archlinux.org/index.php/Network_bridge)

#### Preparing a host's service => PostgreSQL to connection from docker's networks

Using the theory about the implementation of the Linux bridge, it is possible adapting a configuration of the PostgreSQL server.

How to change a configuration of the existing PostgreSQL server:

1. Find the IP address of the bridge inside the host system. By default, the Docker daemon creates the bridge with name = `docker0`. As an example, the IP address is  `172.17.0.1`
2. Bind the PostgreSQL server to the IP address from the first step.
3. Allow connection from the docker network. Add a new rule to `pg_hba.conf` to allow access from the network `172.17.0.0/24`
4. If you have a custom iptables configuration, you should add the next rule to your configuration (the address of the network you should take from the result of the first step). That rule allows connecting to your PostgreSQL server from the docker's network:

   `iptables -A INPUT -s 172.17.0.0/24 -i docker -p tcp -m tcp --dport 5432  -j ACCEPT`

#### Preparing an application inside docker container

The one thing you should make is using the IP address `172.17.0.1` as a database IP address in your application properties.

Additional configuration doesn't have to.

For the docker 18.04+, the IP address of the bridge interface automatically is added to DNS with the name `host.docker.internal`. But the docker repo for Linux has an open issue that relates to this functionality and it might not work.
