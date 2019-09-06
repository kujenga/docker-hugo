# Builder image
FROM golang:1.13-buster AS builder

ENV HUGO_VERSION v0.58.0

ENV GO111MODULE=on
RUN go get -v "github.com/gohugoio/hugo@$HUGO_VERSION"

# Application image
FROM debian:buster

COPY --from=builder /go/bin/hugo /usr/local/bin/hugo

CMD hugo
