FROM golang:alpine
WORKDIR /app

COPY . ./
RUN go mod download
RUN GOOS=linux go build -o hello-world

CMD ["/app/hello-world"]
