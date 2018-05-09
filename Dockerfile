FROM debian:stretch-slim

RUN apt-get -qq update && \
    apt-get install -qqy backupninja duplicity && \
    apt-get install python-swiftclient python-keystoneclient && \
    apt-get install ncftp lftp

CMD backupninja -n
