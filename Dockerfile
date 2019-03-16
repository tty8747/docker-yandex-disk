FROM ubuntu:bionic
MAINTAINER Sergey Chulanov <tty8747@gmail.com>
RUN apt-get update -qq \
    && apt-get install gnupg2 -y \
    && apt-get install wget -y \
    && echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | tee -a /etc/apt/sources.list.d/yandex-disk.list > /dev/null
RUN wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add -
RUN apt-get update -qq \
    && apt-get install -y yandex-disk \
    && apt-get purge -y \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
    && mkdir /root/Yandex.Disk
CMD ["yandex-disk", "start", "--no-daemon", "--dir=/root/Yandex.Disk"]
