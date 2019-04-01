# sinatra-docker-kick-start
A dockerized "hello world" sinatra app. It is a child of the amazing guide at https://rubyplus.com/articles/2461-Docker-Basics-Running-a-Hello-World-Sinatra-App-in-a-Container.

Build with Ruby v-2.3.3. Use docker-compose; the best way to kick-start it is running docker-componse in a container, for that use the following script:

```
$ sudo curl -L --fail https://github.com/docker/compose/releases/download/1.24.0/run.sh -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose

```

now just issue:

`docker-compose run`

if you prefere running manually the hello app:

```
docker run --rm -p 3000:3000 jnunez/hello &
docker exec -ti e69f82ed874d 9618a98bed8e fc55705f1c2b /bin/bash
```

For the blob persistance we are using mongo's GridFS. For a quick start on mongo visit: https://github.com/mongodb/mongo-ruby-driver/blob/master/docs/quick-start.txt 


You may want to get into some networking on the containers, introducing sandboxkey:

Create a netns link in /var/run (as su)
```
   ln -s /var/run/docker/netns/ netns
   ip netns show
```
To get the sandboxkey for jnunez/hello running image:
```   ip netns exec `docker ps -a | grep jnunez/hello | awk '{print $1}' | head -n 1 | xargs -I container docker inspect container | grep "SandboxKey" | awk -F: '{print $2}' | awk -F/ '{print $6}'`ip addr show eth0```
