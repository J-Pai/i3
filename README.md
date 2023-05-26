# i3 Config
Only 1 file contained in this repository.
Meant to replace the default i3 config file located in directory ~/.config/i3/

## Setup

```shell
sudo apt install i3 autorandr arandr rofi i3blocks
sudo mkdir -p /etc/i3/config.d
sudo touch /etc/i3/config.d/${USER}_display.conf
sudo chown ${USER}:${USER} /etc/i3/config.d/${USER}_display.conf
ln -s ~/.config/i3/i3blocks ~/.config
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

assign [title=".*Signal"] 5
exec --no-startup-id signal-desktop
assign [class=".*gamescope.*"] 4
assign [class=".*steam_app_.*"] 4
```

## HIDs

### Mouse Settings

Update `/etc/X11/xorg.conf.d/99-libinput-custom-config.conf`.

```shell
Section "InputClass"
    Identifier "Logitech G602"
    Driver "libinput"
    MatchIsPointer "yes"
    Option "AccelProfile" "flat"
    Option "AccelSpeed" "-0.1"
EndSection
```

### Keychron K2 Configuration

Prefer to use Apple mode since Windows mode FN keys are broken.

https://schnouki.net/post/2019/how-to-use-a-keychron-k2-usb-keyboard-on-linux/
