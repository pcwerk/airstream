# Purpose

The `Airstream` project provides a simple framework/example demonstrating how initiate a continuous integration (CI) and continuous deployment (CD) flow independent of underlying CI/CD technology.

## Strategy
- Developers are expected to develop a container the the different stages of the CI pipeline
- Diverse architecture (OS and software) support
- Diverse development tool support
- Support for Docker-in-docker testing

## Usage

The repository is designed to serve as an example; the provided `main.c` program does not do anything exciting, other that than to print `Hello, world 2`.  The basic practice is to clone the repository then to slowly build up components in the `containers` folder.

To run the trivial templated example:
```bash
$ docker-compose up --build
```

The first time running docker-compose will result in a number of downloads.  If everything goes well, subsequent runs will show this output:

```
$ docker-compose up --build
Building compile
Step 1/6 : FROM amd64/ubuntu:bionic
 ---> 4c108a37151f
Step 2/6 : RUN apt-get update &&     apt-get install -y docker.io &&     apt-get install
 -y docker-compose
 ---> Using cache
 ---> 1b952d1217a5
Step 3/6 : RUN mkdir -p /home/chains
 ---> Using cache
 ---> 41ded5dea658
Step 4/6 : WORKDIR /home/chains
 ---> Using cache
 ---> 0bf34b7402ea
Step 5/6 : COPY . .
 ---> c95331a781ed
Step 6/6 : CMD [ "./airstream.sh" ]
 ---> Running in 85b36b542199
Removing intermediate container 85b36b542199
 ---> 67c509c24974
Successfully built 67c509c24974
Successfully tagged airstream_compile:latest
Recreating airstream ... done
Attaching to airstream
airstream  | lint
airstream  | Building compile
airstream  | Step 1/7 : FROM amd64/ubuntu:bionic
airstream  |  ---> 4c108a37151f
airstream  | Step 2/7 : RUN apt-get update &&     apt-get install -y gcc &&     apt-get 
install -y make
airstream  |  ---> Using cache
airstream  |  ---> 4dc0ae64f6f1
airstream  | Step 3/7 : RUN mkdir -p /home/chains
airstream  |  ---> Using cache
airstream  |  ---> 1bdc175af6f4
airstream  | Step 4/7 : WORKDIR /home/chains
airstream  |  ---> Using cache
airstream  |  ---> e29951c73201
airstream  | Step 5/7 : COPY . .
airstream  |  ---> Using cache
airstream  |  ---> dea89a6f5fef
airstream  | Step 6/7 : WORKDIR /home/chains/src
airstream  |  ---> Using cache
airstream  |  ---> d3ee7976bd35
airstream  | Step 7/7 : CMD [ "./lint.sh" ]
airstream  |  ---> Using cache
airstream  |  ---> 1833040e6680
airstream  | Successfully built 1833040e6680
airstream  | Successfully tagged lint_compile:latest
airstream  | Starting lint ... 
Starting lint ... done
Attaching to lint
airstream  | lint       | /bin/rm -f main.o
airstream  | lint       | /bin/rm -f app
airstream  | lint       | cc -c -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow 
-Wconversion -Werror main.c
airstream  | lint       | cc -o app main.o
airstream  | lint       | /bin/rm -f main.o
airstream  | lint       | lint success
airstream  | lint exited with code 0
airstream  | build
airstream  | Building compile
airstream  | Step 1/7 : FROM amd64/ubuntu:bionic
airstream  |  ---> 4c108a37151f
airstream  | Step 2/7 : RUN apt-get update &&     apt-get install -y gcc &&     apt-get 
install -y make
airstream  |  ---> Using cache
airstream  |  ---> 4dc0ae64f6f1
airstream  | Step 3/7 : RUN mkdir -p /home/chains
airstream  |  ---> Using cache
airstream  |  ---> 1bdc175af6f4
airstream  | Step 4/7 : WORKDIR /home/chains
airstream  |  ---> Using cache
airstream  |  ---> e29951c73201
airstream  | Step 5/7 : COPY . .
airstream  |  ---> Using cache
airstream  |  ---> 7247da03eb69
airstream  | Step 6/7 : WORKDIR /home/chains/src
airstream  |  ---> Using cache
airstream  |  ---> b58f74fb020a
airstream  | Step 7/7 : CMD [ "./build.sh" ]
airstream  |  ---> Using cache
airstream  |  ---> e82c3981fb63
airstream  | Successfully built e82c3981fb63
airstream  | Successfully tagged build_compile:latest
airstream  | Starting build ... 
Starting build ... done
Attaching to build
airstream  | build      | /bin/rm -f main.o
airstream  | build      | /bin/rm -f app
airstream  | build      | cc -c main.c
airstream  | build      | cc -o app main.o
airstream  | build      | /bin/rm -f main.o
airstream  | build      | build success
airstream  | build exited with code 0
airstream  | unit_test
airstream  | Building compile
airstream  | Step 1/7 : FROM amd64/ubuntu:bionic
airstream  |  ---> 4c108a37151f
airstream  | Step 2/7 : RUN apt-get update &&     apt-get install -y gcc &&     apt-get install -y make
airstream  |  ---> Using cache
airstream  |  ---> 4dc0ae64f6f1
airstream  | Step 3/7 : RUN mkdir -p /home/chains
airstream  |  ---> Using cache
airstream  |  ---> 1bdc175af6f4
airstream  | Step 4/7 : WORKDIR /home/chains
airstream  |  ---> Using cache
airstream  |  ---> e29951c73201
airstream  | Step 5/7 : COPY . .
airstream  |  ---> Using cache
airstream  |  ---> df39b199998d
airstream  | Step 6/7 : WORKDIR /home/chains/src
airstream  |  ---> Using cache
airstream  |  ---> f983d64a0e82
airstream  | Step 7/7 : CMD [ "./unit_test.sh" ]
airstream  |  ---> Using cache
airstream  |  ---> 2155ad739c5c
airstream  | Successfully built 2155ad739c5c
airstream  | Successfully tagged unittest_compile:latest
airstream  | Starting unit_test ... 
Starting unit_test ... done
Attaching to unit_test
airstream  | unit_test  | /bin/rm -f main.o
airstream  | unit_test  | /bin/rm -f app
airstream  | unit_test  | cc -c  main.c
airstream  | unit_test  | cc -o app main.o
airstream  | unit_test  | /bin/rm -f main.o
airstream  | unit_test  | unit test success
airstream  | unit_test exited with code 0
airstream  | airstream exited with code 0
```

## Callbacks

In the example provided above, the results are logged to the console.  In practice, it is useful to have call back functions. For example, given the this code snippet:

```bash
if [ -f "app" ] ; then
   echo "lint success"
   exit 0
else
   echo "lint failed"
   exit 1
fi
```

We could easily add a call back either with a `curl` or some other API calls to record success or failure of that stage.  If we were to integrate this into a real CI framework, e.g. Jenkins or Bamboo, we would rely on the CI system to detect and handle success (or failure) of a that stage.

## References

- [Docker in Docker?](https://itnext.io/docker-in-docker-521958d34efd)
- [Learn How to Set Up a CI/CD Pipeline From Scratch](https://dzone.com/articles/learn-how-to-setup-a-cicd-pipeline-from-scratch)
