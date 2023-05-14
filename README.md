# i3 Config
Only 1 file contained in this repository.
Meant to replace the default i3 config file located in directory ~/.config/i3/

## Setup

```shell
sudo apt install i3 autorandr arandr rofi
sudo mkdir -p /etc/i3/config.d
sudo touch /etc/i3/config.d/${USER}_display.conf
sudo chown ${USER}:${USER} /etc/i3/config.d/${USER}_display.conf
```

## Setting Display Configurations

```shell
# No connected display
autorandr --save laptop
# With connected display
autorandr --save connected
```

## Platform Specific Config

Update `/etc/i3/config.d/${USER}_display.conf`.

```shell
workspace 10 output "eDP-1"
workspace 1 output "HDMI-1" "eDP-1"
workspace 4 output "HDMI-1" "eDP-1"
workspace 5 output "HDMI-1" "eDP-1"
```
