FROM alpine:3.6

ADD . /go-ethereum
RUN \
  apk add --no-cache git go make gcc musl-dev linux-headers && \
  (cd go-ethereum && make geth)                             && \
  cp go-ethereum/build/bin/geth /usr/local/bin/             && \
  apk del git go make gcc musl-dev linux-headers            && \
  rm -rf /go-ethereum

EXPOSE 9545 30333 30333/udp

ENTRYPOINT ["geth"]
