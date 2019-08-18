
Docker image providing Xvfb display and X11vnc server.



1. build the image:
$docker build -t docker-xvfb-multi-displays-chromium
2. build your image based on this image.
3. run you image by: 
$ docker run -d -p 8090:8090 -p 5900-5910:5900-5910 your-image:latest

you can view the enterior displays with vnc clinet, on 127.0.0.1:5900-5901 password=alpine

