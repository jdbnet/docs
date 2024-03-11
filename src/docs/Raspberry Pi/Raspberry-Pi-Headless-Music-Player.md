### Raspberry Pi OS Setup

* Put a Micro SD card in to your Laptop/PC and format it.
* Download Raspberry Pi Imager, launch it and choose Raspberry Pi OS Lite then your Micro SD card.
* Once complete, take the SD card, put it into the Pi, then connect a monitor, mouse and keyboard, as well as power. If you plan to use Ethernet then connect this here. To connect to Wi-Fi instead, then complete these next steps. If you are using Ethernet, then skip to Raspberry Pi OS Setup (Continued).

### Connecting to Wi-Fi

```bash
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

At the bottom of the file, enter this…

```
network={
                ssid="Your SSID"
                psk="Your Password"
            }
```

Reboot, then you should be connected

### Raspberry Pi OS Setup (Continued)

Enable SSH through ```sudo raspi-config``` then change the user’s password.

Run the following commands to install the dependencies…

```bash
sudo apt update

sudo apt-get install samba mplayer
```

### Creating the Music Player

Create a Media folder on the SD card for the music to go in to, mine is created in ```/home/pi/Music```

```bash
mkdir /home/pi/Music
```

Setup a Samba share so that you can add and remove tracks easily from another PC…

```bash
sudo nano /etc/samba/smb.conf
```

At the bottom of this file add the following…

```
[music]
path = /home/pi/Music
valid users = pi
read only = no
```

CTRL + X then Y to save and exit

Run this command to create a password for signing into your share from another PC…

```bash
sudo smbpasswd -a pi
```

Then enter your password of choice

Run this command to restart the Samba service…

```bash
sudo service smbd restart
```

Connect to the Samba share from another PC and copy the music files over.

Next, run this command to take you into the startup file so that the music player starts playing at boot…

```bash
sudo nano /etc/rc.local
```

Between the ‘your IP address is’ information and the ‘exit 0’ enter, add the following…

```bash
cd /home/pi/Music
mplayer -shuffle *.*
```

CTRL + X then Y to save and exit

Reboot your pi, then the music should start to play when it has booted back up

### Setting the Volume

If you need to change the volume, SSH to the Pi and enter alsamixer in the terminal.

Change the volume with the arrow keys, then press ESC to save and close.

That’s it, your music player should be ready to go.