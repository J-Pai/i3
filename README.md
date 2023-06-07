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
for_window [class=".*steam_app_.*"] move to workspace 4

exec --no-startup-id /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

exec --no-startup-id blueman-applet
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

To fix dmesg mouse spam:

```shell
[17532.188012] logitech-djreceiver 0003:046D:C537.0012: Unexpected input report number 128
```

Add the following to `/etc/modprobe.d/blacklist.conf`:

```shell
blacklist hid_logitech_dj
```

### Keychron K2 Configuration

Prefer to use Apple mode since Windows mode FN keys are broken.

https://schnouki.net/post/2019/how-to-use-a-keychron-k2-usb-keyboard-on-linux/

## Motherboard

ASRock B650E PG-ITX is quite new. As such, the chipset driver is not yet
supported by Linux.

Following the following instructions at:

https://github.com/Fred78290/nct6687d

### Load Module at Boot

```shell
sudo sh -c 'echo "nct6687" >> /etc/modules'
```

### Test Kernel Module for NCT6687D

```shell
sudo modprobe nct6687 force=1
nct6686-isa-0a20
Adapter: ISA adapter
+12V:            0.00 V  (min =  +0.00 V, max =  +0.00 V)
+5V:             0.00 V  (min =  +0.00 V, max =  +0.00 V)
+3.3V:           3.39 V  (min =  +0.00 V, max =  +3.39 V)
CPU Soc:         0.00 V  (min =  +0.00 V, max =  +0.00 V)
CPU Vcore:       0.00 V  (min =  +0.00 V, max =  +0.00 V)
CPU 1P8:         0.00 V  (min =  +0.00 V, max =  +0.00 V)
CPU VDDP:        0.00 V  (min =  +0.00 V, max =  +0.00 V)
DRAM:            0.00 V  (min =  +0.00 V, max =  +0.00 V)
Chipset:         0.00 V  (min =  +0.00 V, max =  +0.00 V)
CPU SA:          0.00 V  (min =  +0.00 V, max =  +0.00 V)
Voltage #2:      0.00 V  (min =  +0.00 V, max =  +0.00 V)
AVCC3:           0.00 V  (min =  +0.00 V, max =  +0.00 V)
AVSB:            3.39 V  (min =  +0.00 V, max =  +3.39 V)
VBat:            1.81 V  (min =  +0.00 V, max =  +1.81 V)
CPU Fan:        679 RPM  (min =  624 RPM, max =  738 RPM)
Pump Fan:       781 RPM  (min =  764 RPM, max =  786 RPM)
System Fan #1:    0 RPM  (min =    0 RPM, max =    0 RPM)
System Fan #2:  703 RPM  (min =  702 RPM, max =  717 RPM)
System Fan #3:    0 RPM  (min =    0 RPM, max =    0 RPM)
System Fan #4:    0 RPM  (min =    0 RPM, max =    0 RPM)
System Fan #5:    0 RPM  (min =    0 RPM, max =    0 RPM)
System Fan #6:    0 RPM  (min =    0 RPM, max =    0 RPM)
CPU:            +42.5°C  (low  = +42.0°C, high = +42.5°C)
System:         +41.0°C  (low  = +41.0°C, high = +41.5°C)
VRM MOS:        +34.5°C  (low  = +34.0°C, high = +35.0°C)
PCH:            +42.0°C  (low  = +40.0°C, high = +46.0°C)
CPU Socket:     +56.0°C  (low  = +36.0°C, high = +56.0°C)
PCIe x1:        +62.0°C  (low  = +62.0°C, high = +62.0°C)
M2_1:           +62.0°C  (low  = +62.0°C, high = +62.0°C)
```
