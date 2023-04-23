# STEP 1 build executable binary
FROM golang:1.20.3-alpine3.17 as builder

WORKDIR /go/src/app

COPY main.go /go/src/app/

RUN go build -o /go/src/app ./main.go

# STEP 2 build a small image
FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app/main /fc-docker-challenge

ENTRYPOINT [ "/fc-docker-challenge" ]
