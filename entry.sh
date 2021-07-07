#!/bin/bash

#nohup /usr/bin/Xvfb :0 -screen 0 $RESOLUTION -ac +extension GLX +render -noreset > /dev/null 2>&1 &
#nohup startxfce4 > /dev/null 2>&1 &
#nohup x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -forever -bg -rfbauth /home/alpine/.vnc/passwd -users alpine -rfbport 5900 > /dev/null 2>&1 &
MULTIUSER=alpine
MULTICOUNT=5

echo "Starting Xvfb..."
    	for (( serverN=0; serverN<$MULTICOUNT; serverN++ ))
    	do
            	display=$serverN
            	usern=$MULTIUSER

            	echo "vncserver $serverN"
            	echo "$usern \"vncserver :$display $MULTIARGS\""
            	#su $usern -c "vncserver :$display $MULTIARGS"
            	nohup /usr/bin/Xvfb :$display  &

    	done
sleep 3
echo "Starting X11vnc..."
    	for (( serverN=0; serverN<$MULTICOUNT; serverN++ ))
    	do
            	display=$serverN
            	usern=$MULTIUSER

            	echo "vncserver $serverN"
            	echo "$usern \"vncserver :$display $MULTIARGS\""
            	#su $usern -c "vncserver :$display $MULTIARGS"

            	nohup x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :$display -forever -bg -rfbauth /home/alpine/.vnc/passwd  &

    	done


#/etc/init.d/vncservers start
