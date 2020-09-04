FROM golang:1.14.6-alpine as go-build

ENV GOPROXY https://goproxy.cn/
ENV GO111MODULE on

RUN mkdir -p /usr/local/app
WORKDIR /usr/local/app

COPY .. .

RUN go build -o ./target/oss-server ./main/main.go

FROM alpine as oss-server

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

COPY --from=go-build /usr/local/app/target/oss-server /oss-server

EXPOSE 18080

CMD ["/oss-server"]