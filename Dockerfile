FROM alpine:3.5

RUN apk add ncurses --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main && \
    apk add erlang && \
    rm -rf /var/cache/apk/*

ENV APP_NAME test
ENV PORT 4000

ADD _build/dev/rel/test/releases/0.1.0/$APP_NAME.tar.gz /app/
WORKDIR /app

EXPOSE $PORT

CMD trap exit TERM; /app/bin/$APP_NAME foreground & wait
