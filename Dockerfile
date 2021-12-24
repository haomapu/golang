FROM golang:alpine
WORKDIR /app

RUN go mod download

COPY . .
RUN GOOS=linux go build -o hello-world

CMD ["/app/hello-world"]
