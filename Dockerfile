FROM 10.106.146.20:5001/alpine3.9-node:10


LABEL maintainer="Jan Kuri <jan@bleenco.com>"

ENV DISPLAY :99
ENV RESOLUTION 1920x1080x24 
RUN apk update && \
    apk add --no-cache grep docker bash && \
    # Installs latest Chromium package.
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache \
    chromium@edge \
    harfbuzz@edge \
    nss@edge \
    freetype@edge \
    ttf-freefont@edge && \
    rm -rf /var/cache/* && \
    mkdir /var/cache/apk

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache ca-certificates curl openssl sudo xvfb x11vnc@edge  xfce4 faenza-icon-theme bash \
    && adduser -h /home/alpine -s /bin/bash -S -D alpine && echo -e "alpine\nalpine" | passwd alpine \
    && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers



WORKDIR /home/alpine
ADD init.d-vncservers /etc/init.d/vncservers
RUN mkdir -p /home/alpine/.vnc && x11vnc -storepasswd alpine /home/alpine/.vnc/passwd && \
    chown alpine /home/alpine/.vnc/passwd

COPY entry.sh /entry.sh

CMD []
