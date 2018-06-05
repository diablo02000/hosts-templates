FROM golang:alpine as builder

RUN apk add --no-cache --virtual git && \
    go get github.com/alecthomas/gometalinter && \
    gometalinter --install

FROM golang:alpine
MAINTAINER diablo02000
COPY --from=builder /go/bin/* /go/bin/
ENTRYPOINT ["gometalinter"]
