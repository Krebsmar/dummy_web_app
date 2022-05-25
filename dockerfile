FROM golang:alpine3.16


# Set the Current Working Directory inside the container
WORKDIR /golang-server

COPY . .

# Build the Go app
RUN go build -o ./out/golang-server .


# This container exposes port 8080 to the outside world
EXPOSE 80

# Run the binary program produced by `go install`
CMD ["./out/golang-server"]