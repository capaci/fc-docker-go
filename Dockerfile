################################################################
# Build stage
FROM golang:1.19 as build

WORKDIR /go/src/app
COPY . .

RUN GOOS=linux go build -o /go/bin/main -ldflags='-s -w' .


################################################################
# Final stage
FROM scratch

COPY --from=build /go/bin/main /
CMD ["/main"]
