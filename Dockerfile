FROM golang:1.20.3-alpine AS builder
WORKDIR /usr/src/app
COPY app.go .
RUN go mod init forstudentsapp
RUN go mod tidy
RUN go build -o app .
FROM scratch
WORKDIR /app
COPY --from=builder /usr/src/app/ /app/
EXPOSE 8000
CMD ["./app"]