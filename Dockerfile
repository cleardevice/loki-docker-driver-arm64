FROM golang:1.23-alpine AS builder

RUN apk add git
RUN git clone https://github.com/grafana/loki.git

WORKDIR /go/loki

ARG LOKI_DRIVER_VERSION
ENV LOKI_DRIVER_VERSION=v${LOKI_DRIVER_VERSION}
RUN git checkout $LOKI_DRIVER_VERSION
RUN go get github.com/grafana/pyroscope-go
RUN go mod vendor
RUN GOOS=linux GOARCH=arm64 GOARM=8 go build ./clients/cmd/docker-driver

FROM alpine:3.20
#RUN mkdir -p /run/docker/plugins
COPY --from=builder /go/loki/docker-driver /bin/
CMD ["/bin/docker-driver"]
