FROM golang AS builder
WORKDIR /app

COPY . ./
RUN go mod download
RUN GOOS=linux go build -o hello-world
buildctl build ... --export-cache type=local,dest=/tmp/.buildx-cache
buildctl build ... --import-cache type=local,src=/tmp/.buildx-cache-new
FROM alpine AS production
COPY --from=builder /app/hello-world /app/hello-world

CMD ["/app/hello-world"]
