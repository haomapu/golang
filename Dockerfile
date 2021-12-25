FROM golang AS builder
WORKDIR /app

COPY . ./
RUN go mod download
RUN GOOS=linux go build -o hello-world

FROM alpine 
COPY --from=builder /app/hello-world /app/hello-world

CMD ["/app/hello-world"]
