FROM golang:1.12.5-alpine3.9
LABEL Author="Nikola.Zelenkov <nikola.zelenkov@gmail.com>"
ENV APPNAME=server-go
ENV GOBIN=/go/bin
ENV GOPATH=/go/src
WORKDIR ${GOPATH}/${APPNAME}
COPY server.go ${GOPATH}/${APPNAME}
RUN apk update && apk add git && \
cd ${GOPATH}/${APPNAME} && \
go get -d -v && go build -v && go install -v && \
rm -rf /var/cache/apk/*
CMD ["server-go"]