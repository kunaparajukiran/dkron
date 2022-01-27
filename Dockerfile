FROM golang:1.17
LABEL maintainer="Victor Castell <victor@victorcastell.com>"

EXPOSE 80 8946

RUN mkdir -p /app
WORKDIR /app

COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

COPY . .
RUN go install ./...

CMD ["dkron agent --server --bootstrap-expect=1 --http-addr=80"]
