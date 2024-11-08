# tzyfetch .8.
tzyfetch is an extremely simple fetch utility, built for a single line output with a three character distro logo.

## Install

### Run directly
    git clone https://github.com/cappsyco/tzyfetch.git
    cd tzfetch
    chmod +x tzyfetch.sh
    ./tzyfetch.sh

You can of course also copy to the bin of your choice. I owe you a proper generic install script.
    
### Arch Linux 
[tzy lives happily in the AUR](https://aur.archlinux.org/packages/tzyfetch). Use your favourite method for installation, but yay will do the job nicely.

	yay tzyfetch
	
### Other?
I'm figuring that out currently.

## Use
    tzyfetch
Default behaviour will return the logo and name of your distro, plus system and session specific information.

    tzyfetch -d pisilinux
    tzyfetch -distro freebsd
Outputs the logo of the specified distro ID.

    tzyfetch -d all
Outputs every distro logo and ID that tzy knows.
