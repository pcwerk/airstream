FROM amd64/ubuntu:bionic

RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get install -y docker-compose

RUN mkdir -p /home/chains

WORKDIR /home/chains

COPY . .

CMD [ "./airstream.sh" ]
