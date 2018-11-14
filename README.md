# I3 Config for VM
Only 1 file contained in this repository.
Meant to replace the default i3 config file located in directory ~/.config/i3/

## Ubuntu GUI File Browser
When using i3 with Ubuntu, there may come a time when you need a GUI based browser. Typically the default browser is nautilus.

Starting nautilus from the d-menu often opens up a desktop which stays on until you exit i3. To prevent this from happening, run the following command:
```
gsettings set org.gnome.desktop.background show-desktop-icons false
```
NOTE: With the use of Gnome3 in Ubuntu 18.04, this option is no longer necessary. Older LTS versions will probably still need this command.
### Alternative Way
The previous method breaks Unity DE's desktop.

To avoid this simply add the following line to ~/.bash_aliases (or an equivalent file).
```
alias nautilus='nautilus --no-desktop'
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
export TERMINAL="gnome-terminal"
sudo update-alternatives --config x-terminal-emulator # Another way to set default terminal.
```
Adding the previous line to the ~/.profile file will ensure the environment variable is loaded upon login.

See the man page for i3-sensible-terminal for more information.

## Compton and i3
To get i3 performing faster in VirtualBox (maybe VMWare Workstation), you may want to install compton. This i3 config file also uses a program called `hsetroot` to set the background to black. Make sure to install that prior to using i3.

Make sure to use the launchpad repository to get the latest version of compton.
```
sudo add-apt-repository ppa:richardgv/compton
sudo apt-get update
sudo apt-get install hsetroot
sudo apt-get install compton
```

