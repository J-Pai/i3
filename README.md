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
After the file is removed, log out and log back in.

## Changing Default Terminal
If you would like to change the terminal that is opened by default ($mod + enter) you can set the environment variable $TERMINAL to your desired terminal. The following is an example.
```
export TERMINAL="tilix"
```
Adding the previous line to the ~/.profile file will ensure the environment variable is loaded upon login.

See the man page for i3-sensible-terminal for more information.
