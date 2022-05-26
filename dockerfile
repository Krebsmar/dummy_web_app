##
## Build
##

FROM golang:alpine3.16 AS build

# Set the Current Working Directory inside the container

WORKDIR /app
COPY go.mod ./

COPY golang-server/*.go ./

RUN go build -o /golang-server

##
## Deploy
##

FROM golang:alpine3.16

WORKDIR /

COPY --from=build /golang-server /golang-server

EXPOSE 80

#USER nonroot:nonroot

ENTRYPOINT ["/golang-server"]