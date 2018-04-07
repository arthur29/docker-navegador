FROM ubuntu:latest

RUN apt-get update && apt-get install firefox dialog openssl libnss3-tools \
        libcurl3 dbus libdbus-1-3 wget dbus-x11 \
        libxext-dev libxrender-dev libxtst-dev -y

RUN mkdir -p /var/run/dbus

CMD dbus-daemon --system & dbus-daemon --session & journalctl -t /usr/bin/firefox & firefox
