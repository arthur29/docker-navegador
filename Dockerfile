FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget \
        openssl libnss3-tools libcurl3 dbus libdbus-1-3 \
        dbus-x11 libxext-dev libxrender-dev libxtst-dev -y && \
        mkdir -p /var/run/dbus
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&  \
        echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
        apt-get update && apt-get install google-chrome-stable -y
RUN useradd -m navegador

USER navegador

CMD dbus-daemon --system & dbus-daemon --session & journalctl -t /usr/bin/firefox & google-chrome-stable --no-sandbox
