FROM golang:1.19.3-alpine as build

WORKDIR /app

COPY . /app

RUN go build -o main .

FROM scratch

WORKDIR /app

COPY --from=build /app/main .

CMD ["/app/main"]


