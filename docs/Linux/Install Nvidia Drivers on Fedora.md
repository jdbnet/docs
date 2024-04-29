It took me a while to work out how to get Nvidia drivers installed on Fedora so I thought I'd document this for my future self and anyone else that comes across this.

## Installation

Start by enabling the RPM Fusion repositories...

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Update the system...

```bash
sudo dnf update -y
```

Then install the Nvidia drivers...

```bash
sudo dnf install xorg-x11-drv-nvidia-cuda
```

Reboot the system, then check the Nvidia driver version...

```bash
modinfo -F version nvidia
```

For me at the time of writing this, it shows ```550.76```