Steam Link is a nifty technology that allows you to stream games from one device, such as your computer or laptop, to another device, such as a Raspberry Pi. Using Steam Link allows you to easily play all of your games on your TV without having to connect up a bulky piece of hardware.

First off you'll need to flash the latest Raspberry Pi OS image with Desktop to your Pi's SD card

Then once you've booted it up you'll need to run the following commands

The first command will update your repositories

```bash
sudo apt update
```

Then you'll need to install Steam Link

```bash
sudo apt install steamlink
```

Once that's done, you should find a new shortcut in your start menu. Before you open it you'll need to either connect your controller over USB or Bluetooth

Once you've done that, open Steam Link and your PC should be discovered. If it isn't, check your Remote Play settings on your computer then try again