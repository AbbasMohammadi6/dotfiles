You need to istall bumblebee-status:
1. clone it from here
https://github.com/tobi-wan-kenobi/bumblebee-status
2. add the path to the config file

Install feh:
sudo apt-get update -y
sudo apt-get install -y feh

To make terminal window transparent you need to install 'picom':
sudo apt install picom

There is a script for notifing when the laptop battery needs charging, read the readme from here:
https://github.com/rjekker/i3-battery-popup
1. clone the repository
2. put the script in the $PATH (you could get it by this command "echo $PATH")
3. put a .wav sound somewhere and its address using the "-s" option.
exec --no-startup-id i3-battery-popup -L 16 -s ~/i3-battery-popup.wav
this command makes the script set a warning and a sound on 15% and 8% battery.
