FROM golang:alpine
WORKDIR /app

COPY . .
RUN GOOS=linux go build -o hello-world

CMD ["/app/hello-world"]
