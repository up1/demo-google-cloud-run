FROM golang:1.12 as builder
WORKDIR /go/src/helloworld
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o helloworld

FROM alpine
COPY --from=builder /go/src/helloworld/helloworld /helloworld
CMD ["/helloworld"]