FROM ubuntu:latest

RUN apt-get update && apt-get install firefox dialog openssl libnss3-tools \
        libcurl3 dbus libdbus-1-3 wget dbus-x11 \
        libxext-dev libxrender-dev libxtst-dev -y

RUN wget https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb

RUN dpkg -i warsaw_setup64.deb

ENV XDG_RUNTIME_DIR /run/user/`id -u`

RUN mkdir -p /var/run/dbus

RUN groupadd -r modseg && useradd --no-log-init -r -g modseg modseg

RUN chmod +x /etc/init.d/warsaw

CMD dbus-daemon --system & dbus-daemon --session & journalctl -t /usr/bin/firefox & firefox
#CMD dbus-daemon --system & dbus-daemon --session & /etc/init.d/warsaw start & tail -f dpkg.log
#ENTRYPOINT /usr/bin/tail -f /var/log/dpkg.log
