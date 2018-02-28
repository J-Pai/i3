# I3 Config for VM
Only 1 file contained in this repository.
Meant to replace the default i3 config file located in directory ~/.config/i3/

## Ubuntu GUI File Browser
When using i3 with Ubuntu, there may come a time when you need a GUI based browser. Typically the default browser is nautilus.

Starting nautilus from the d-menu often opens up a desktop which stays on until you exit i3. To prevent this from happening, run the following command:
```
gsettings set org.gnome.desktop.background show-desktop-icons false
```

## Refreshing dmenu Applications
When using i3 in Ubuntu, the dmenu occasionally does not pick up new directories that have been added to the PATH variable. In this case, remove the file dmenu\_run in the directory ~/.cache/

e.g.
```
rm ~/.cache/dmenu_run
```
