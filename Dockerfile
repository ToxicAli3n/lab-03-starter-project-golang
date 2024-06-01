FROM golang:1.22.0-alpine AS build

WORKDIR /lab-03-starter-project-golang

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN go build -o build/fizzbuzz

FROM scratch

WORKDIR /lab-03-starter-project-golang

COPY --from=build /lab-03-starter-project-golang/build/fizzbuzz /fizzbuzz
COPY --from=build /lab-03-starter-project-golang/templates templates

# Command to run the application
CMD ["/fizzbuzz", "serve"]
