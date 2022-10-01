FROM debian:{IMAGE}

RUN apt-get -qq update && \
    apt-get install -qqy curl lsb-release && \
    echo "deb http://apt.cloud.mygento.com/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/mygento.list && \
    curl -sSLo /etc/apt/trusted.gpg.d/mygento.asc http://apt.cloud.mygento.com/public.asc && \
    apt-get -qq update && \
    apt-get install -qqy backupninja duplicity && \
    apt-get install -qqy rclone && \
    apt-get install -qqy python3-swiftclient python3-keystoneclient && \
    apt-get install -qqy ncftp lftp && \
    apt-get install -qqy default-mysql-client && \
    apt-get clean

CMD backupninja -n
