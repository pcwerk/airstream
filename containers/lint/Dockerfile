FROM amd64/ubuntu:bionic

RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y make 

RUN mkdir -p /home/chains
WORKDIR /home/chains

COPY . . 

WORKDIR /home/chains/src
CMD [ "./lint.sh" ]
