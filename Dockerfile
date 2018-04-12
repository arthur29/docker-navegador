FROM ubuntu:latest

RUN apt-get update && apt-get install firefox dialog openssl libnss3-tools \
        libcurl3 dbus libdbus-1-3 wget dbus-x11 \
        libxext-dev libxrender-dev libxtst-dev -y

RUN /bin/bash -c 'mkdir -p /var/run/dbus $HOME/.mozilla'

COPY default.js /

RUN firefox -headless www.google.com & PID=`jobs -p` && sleep 20 && kill $PID; exit 0

RUN /bin/bash -c 'cat /default.js >> $HOME/.mozilla/firefox/*.default/prefs.js'

CMD dbus-daemon --system & dbus-daemon --session & firefox
