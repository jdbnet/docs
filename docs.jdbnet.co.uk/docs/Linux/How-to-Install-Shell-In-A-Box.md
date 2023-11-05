Shell In A Box is a web based terminal emulator created by Markus Gutschke. It has a built-in web server that runs as a web-based SSH client on a specified port and prompt you a web terminal emulator to access and control your Linux Server SSH Shell remotely using any AJAX/JavaScript and CSS enabled browsers.

### Installation

```bash
sudo apt install shellinabox
```

```bash
sudo /etc/init.d/shellinabox start
```

### Change Default Port (Optional)

```bash
sudo nano /etc/default/shellinabox
```

Find the line ```SHELLINABOX_PORT``` and change this number to anything you like

Save and exit the text editor then run the following command to restart the service

```bash
sudo /etc/init.d/shellinabox restart
```