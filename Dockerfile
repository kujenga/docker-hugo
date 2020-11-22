# Builder image
FROM golang:1.15-buster AS builder

ENV HUGO_VERSION v0.78.2

# Install Hugo, ref:
# https://gohugo.io/getting-started/installing/
RUN git clone https://github.com/gohugoio/hugo.git /tmp/hugo
WORKDIR /tmp/hugo
RUN git reset --hard $HUGO_VERSION
RUN go install --tags extended

# Application image
FROM debian:buster

COPY --from=builder /go/bin/hugo /usr/local/bin/hugo

CMD hugo
