FROM alpine
WORKDIR /home/cobol
COPY gnucobol.tar.gz .

RUN set -x && \
    apk update && \
    apk add --no-cache gmp gmp-dev db db-dev build-base && \
    tar zxvf gnucobol.tar.gz && \
    cd gnucobol-3.0-rc1 && \
    ./configure && \
    make && make install
COPY main.cbl .
RUN cobc -x ./main.cbl
CMD ["./main"]
