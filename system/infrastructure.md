---
title: Glytoucan Infrastructure
layout: default
---

# Development Practices and Infrastructure


## Docker

As the numbers of subsystems required to run glytoucan.org grew, it became clear that an organized method of containing and managing these subsystems was necessary.  Each subsystem has it's own requirements and keeping track of them was a tedious process.  Creating a [Docker](http://www.docker.com) environment for each one enabled the creation of multiple virtual systems, keeping a record of the necessary requirements into it's own Dockerfile.
This allowed for the quick creation of identical environments within high end servers, test environments, and local development laptops.

#### a list of dockerfiles

The following is a sample of the DockerFiles created.

* [glyspace database](https://bitbucket.org/glycosw/docker-postgres) (postgres)
* [glyspace cache](https://github.com/glytoucan/docker-glyspacesquid) (explained below) 
* [togostanza](https://github.com/glytoucan/docker-stanza) - dockerfile for the TogoStanza framework (ruby version) 
* [virtuoso](https://github.com/aokinobu/docker-virtuoso) - dockerfile for Virtuoso latest version

### Squid

The imaging generation web service from within glyspace was found to be quite CPU-intensive when a large number of requests were received.  After a few hits on the browsing functionality of the website, the backend server was fully loaded on generating all images for the page, including previously generated ones.  To facilitate this, a caching mechanism was added between the http server and glyspace webservice.  This dropped the number of hits considerably as the need to generate images decreased.  Now the backend server has 0% load consistently with the caching mechanism enabled.  

With the docker linking functionality, it was very simple to add a separate Squid caching server in between the glytoucan front-end and glyspace backend subsystems.

Here is an example of how this is implemented.  The below is the docker command to start the glytoucan container.

100% CPU:

``` bash
docker run -d -h local.glytoucan -p 80:80 -v /opt/glytoucan/tmp:/var/www/glytoucan.org/app/tmp -v /mnt/jenkins/workspace/glytoucan:/tmp/glytoucan.org -v /opt/glytoucan/apachelogs:/var/log/apache2 --link glyspace:test.glytoucan.org --link stanza_bluetree:stanza.glytoucan.org --name="glytoucan" aoki/glytoucan_dev
```

Any connections to *test.glytoucan.org* are sent to the glyspace container.

A caching service is prepared which accesses this *glyspace* container, the caching service is setup to use the glyspace.glytoucan.org domain.

```bash
docker run -h cache.glytoucan.org -p 3180:80 -p 3128:3128 --link glyspace:glyspace.glytoucan.org --name="glyspacesquid" -d aoki/glyspacesquid
``` 

When utilizing this caching service, the glyspace processes drop to 0% CPU:

``` bash
docker run -d -h local.glytoucan -p 90:80 -v /opt/glytoucan/tmp:/var/www/glytoucan.org/app/tmp -v /mnt/jenkins/workspace/glytoucan:/tmp/glytoucan.org -v /opt/glytoucan/apachelogs:/var/log/apache2 --link glyspacesquid:test.glytoucan.org --link stanza_bluetree:stanza.glytoucan.org --name="glytoucan" aoki/glytoucan_dev
```

One command-line parameter was modified for any network connectivity to the test.glytoucan.org domain to be redirected to glyspacesquid instead.

## Development practices

### Continuous Integration

Docker proved to be a key aspect in simplifying the setup of an environment and so utilizing this tool together with a continuously integrated service enabled us to quickly have test environments that automatically deploy when code changes are committed.

### Maven Repository


