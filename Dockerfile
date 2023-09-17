FROM golang:1.16-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -ldflags '-w -s' -o start .

FROM scratch
COPY --from=builder /app/start .
ENTRYPOINT [ "./start" ]